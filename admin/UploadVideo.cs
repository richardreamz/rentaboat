using System;
using System.IO;
using System.Reflection;
using System.Threading;
using System.Threading.Tasks;

using Google.Apis.Auth.OAuth2;
using Google.Apis.Auth.OAuth2.Flows;
using Google.Apis.Auth.OAuth2.Responses;
using Google.Apis.Services;
using Google.Apis.Upload;
using Google.Apis.Util.Store;
using Google.Apis.YouTube.v3;
using Google.Apis.YouTube.v3.Data;

namespace TestYoutubeUpload
{
    /// <summary>
    /// YouTube Data API v3 sample: upload a video.
    /// Relies on the Google APIs Client Library for .NET, v1.7.0 or higher.
    /// See https://developers.google.com/api-client-library/dotnet/get_started
    /// </summary>
    public class UploadVideo
    {
        [STAThread]
        static void Main(string[] args)
        {
            Console.WriteLine("YouTube Data API: Upload Video");
            Console.WriteLine("==============================");

            try
            {
                new UploadVideo().Run().Wait();
            }
            catch (AggregateException ex)
            {
                foreach (var e in ex.InnerExceptions)
                {
                    Console.WriteLine("Error: " + e.Message);
                }
            }

            Console.WriteLine("Press any key to continue...");
            Console.ReadKey();
        }

        public async Task Run()
        {

            
            //UserCredential credential;
            //using (var stream = new FileStream("client_secret_618374193828-1i6a260pqbj6618arf80g6opr8u9st9b.apps.googleusercontent.com.json", FileMode.Open, FileAccess.Read))
            //{
            //    credential = await GoogleWebAuthorizationBroker.AuthorizeAsync(
            //        GoogleClientSecrets.Load(stream).Secrets,
            //        // This OAuth 2.0 access scope allows an application to upload files to the
            //        // authenticated user's YouTube channel, but doesn't allow other types of access.
            //        new[] { YouTubeService.Scope.YoutubeUpload },
            //        "user",
            //        CancellationToken.None
            //    );
            //}


            

            ClientSecrets secrets = new ClientSecrets()
            {
                ClientId = "959994441727-vgamn3jrckcpdstg2hqumiecm4h69cl1.apps.googleusercontent.com",
                ClientSecret = "J26hyjV-1hTE2Rukva2ySihO"
            };

        var token = new TokenResponse { RefreshToken = "1//0dsSCD5On3s53CgYIARAAGA0SNwF-L9IrnIhd37EJ8sAecCQ7T2cweIPyp3Jc_zdvAYU_DUDGVvY3CcHBGG1eW5UWrx5JLOiIQE8" };
            var credentials = new UserCredential(new GoogleAuthorizationCodeFlow(
                new GoogleAuthorizationCodeFlow.Initializer
                {
                    ClientSecrets = secrets
                }),
                "user",
              token);
            var youtubeService = new YouTubeService(new BaseClientService.Initializer()
            {
                HttpClientInitializer = credentials,
                ApplicationName = Assembly.GetExecutingAssembly().GetName().Name
            });

            var video = new Video();
            video.Snippet = new VideoSnippet();
            video.Snippet.Title = "Default Video Title";
            video.Snippet.Description = "Default Video Description";
            video.Snippet.Tags = new string[] { "tag1", "tag2" };
          video.Snippet.CategoryId = "1"; // See https://developers.google.com/youtube/v3/docs/videoCategories/list
            video.Status = new VideoStatus();
            video.Status.PrivacyStatus = "private"; // or "private" or "public"
            var filePath = @"G:\PleskVhosts\rentaboat.com\httpdocs\boatvideos\1564_2894_1_657.mp4"; // Replace with path to actual movie file.

            const int KB = 0x400;
            var minimumChunkSize = 50 * KB;
            using (var fileStream = new FileStream(filePath, FileMode.Open))
            {
                var videosInsertRequest = youtubeService.Videos.Insert(video, "snippet,status", fileStream, "video/*");
                videosInsertRequest.ProgressChanged += videosInsertRequest_ProgressChanged;
                videosInsertRequest.ResponseReceived += videosInsertRequest_ResponseReceived;
                videosInsertRequest.ChunkSize = minimumChunkSize * 8;

                await videosInsertRequest.UploadAsync();
            }
        }

      

        void videosInsertRequest_ProgressChanged(Google.Apis.Upload.IUploadProgress progress)
        {
            switch (progress.Status)
            {
                case UploadStatus.Uploading:
                    Console.WriteLine("{0} bytes sent.", progress.BytesSent);
                    break;

                case UploadStatus.Failed:
                    Console.WriteLine("An error prevented the upload from completing.\n{0}", progress.Exception);
                    break;
            }
        }

        void videosInsertRequest_ResponseReceived(Video video)
        {
            Console.WriteLine("Video id '{0}' was successfully uploaded.", video.Id);
        }
    }
}
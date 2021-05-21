using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;
[DataContract]

/// <summary>
/// Summary description for Captcha
/// </summary>
public class RecaptchaApiResponse
{
    [DataMember(Name = "success")]
    public bool Success;

    [DataMember(Name = "error-codes")]
    public List<string> ErrorCodes;
}
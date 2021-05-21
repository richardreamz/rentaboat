<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ctlFooter.ascx.cs" Inherits="ctlFooter" %>
		

           <footer class="full_width footer_block">
              
               
                <div class="container">
					<div class="row" >
						<div class="col-lg-3 col-sm-3 padbot20">
							<h2>Get in touch</h2>
							1-888-610-BOAT<br />
                            631-286-7816<br />
                            <a href="mailto:info@rentaboat.spam" id="lnkMail"> <span style="unicode-bidi: bidi-override;direction: rtl;">moc.taobatner@ofni</span></a><br>
                             <ul class="social">
							<li class="icon1"><a href="https://twitter.com/Rent_A_Boat" target="_blank"alt="twitter"></a></li>
							<li class="icon2"><a href="https://www.facebook.com/JetSki-Rentals-120166268039097/"target="_blank" alt="facebook"></a></li>
							
							<li class="icon4"><a href="https://www.instagram.com/rentaboat_com/? "target="_blank"alt="Instagram"</li>
							<li class="icon5"><a href="javascript:void(0);" alt=""></a></li>
							<li class="icon6"><a href="javascript:void(0);" alt=""></a></li>
						</ul><!-- //SOCIAL ICONS -->
						</div>
                        
						<div class="col-lg-3 col-sm-3">
							<h2>Learn More</h2>
							<a href="admin/BoatOwnerSignup.aspx">How To List</a><br />
							<a href="how_to_rent_a_boat.aspx">How To Rent</a><br />
							<a href="owners-faqs.html">Owners FAQ's</a><br />
							<a href="renter_faqs.aspx">Renters FAQ's</a><br /> 							
						</div>
                        
						<div class="col-lg-3 col-sm-3">
							<h2>Company</h2>
							<a href="about-us.html">About</a><br />
							<a href="news.html">Press</a><br />
							<a href="#">Testimonials</a><br />
							<a href="termsconditions.aspx">Policies</a><br />							
						</div>
                        
                        <div class="col-lg-3 col-sm-3">
							<h2>Articles</h2>
							<a href="renting-vs-owning.html">Renting vs Owning</a><br />
							<a href="rental-tips.html">Rental Tips</a><br />
							<a href="marine-liability-insurance.html">Marine Liability Insurance</a><br />							
						</div>
					</div>
                    <div style="width:65%; margin-left:auto; margin-right:auto"><hr /></div>
                    <div class="row" >
                    	<div align="center">&copy; Copyright 2015 Rent A Boat, RentABoat.com &nbsp;&nbsp; | &nbsp;&nbsp;<a href="#">Privacy Policy</a><br>
                        1-888-610 BOAT (2628) | 320 South Counrty Rd Brookhaven NY 11719<br>

                    </div></div>
				
                    </div>

                    </footer><!-- //FOOTER -->
				 <script>
                   $('#lnkMail').hover(function () {
                       // here you can use whatever replace you want
                       var newHref = $(this).attr('href').replace('spam', 'com');
                       $(this).attr('href', newHref);
                   });
               </script>
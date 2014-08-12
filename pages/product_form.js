function onFormSubmit(e) {
  var inputType = e.namedValues['Product Input Type:'];
  var productName = e.namedValues['Product Name:'];
  var productDesc = e.namedValues['Product Description:'];
  var productAffected = e.namedValues['Products Affected:'];
  var qualType = e.namedValues['Qualification Type:'];
  var projectAmount = e.namedValues['If Revenue or Cost Savings, project annual amount:'];
  var industries = e.namedValues['Applicable Industries:'];
  var clientName = e.namedValues['If Custom Client Work, What is the Client name:'];
  var comments = e.namedValues['Additional Comments/Notes:'];
  var reqName = e.namedValues['Requestor Name:'];
  var reqEmail = e.namedValues['Requestor Email:'];
  var reqPhone = e.namedValues['Requestor Phone Number:'];
  var mangName = e.namedValues['Your Manager Name:'];
  var mangApprove = e.namedValues['Has Your Manager Approved:'];
  var exeSponsor = e.namedValues['Executive Sponsor:'];

  if(!productDesc) {
    productDesc = "N/A";
  }
  if(!productAffected) {
    productAffected = "N/A";
  }
  if(!qualType) {
    qualType = "N/A";
  }
  if(!projectAmount) {
    projectAmount = "N/A";
  }
  if(!industries) {
    industries = "N/A";
  }
  if(!clientName) {
    clientName = "N/A";
  }
  if(!comments) {
    comments = "N/A";
  }

  if (inputType == "Urgent") {
    var userEmail = "swhite@cds-global.com";
  } else if (inputType == "Expeption") {
    var userEmail = "sam.cdsg@gmail.com";
  }
  MailApp.sendEmail({
    to: userEmail,
    subject: "Product Input Form",
    htmlBody: "<h2>The following information has been submitted from the Product Input Form:</h2>" +
              "<ul>" +
    "<li>Product Input Type: " + inputType + "</li>" +
    "<li>Product Name: " + productName + "</li>" +
    "<li>Product Description: " + productDesc + "</li>" +
    "<li>Products Affected: " + productAffected + "</li>" +
    "<li>Qualification Type: " + qualType + "</li>" +
    "<li>Project Annual Ammount: " + projectAmount + "</li>" +
    "<li>Industries: " + industries + "</li>" +
    "<li>Client Name: " + clientName + "</li>" +
    "<li>Comments/Notes: " + comments + "</li>" +
    "</ul>" +
    "<h4>Requestor Information</h4>" +
    "<ul>" +
    "<li>Name: " + reqName + "</li>" +
    "<li>Email: " + reqEmail + "</li>" +
    "<li>Phone: " + reqPhone + "</li>" +
    "<li>Manger Name: " + mangName + "</li>" +
    "<li>Manager Approval: " + mangApprove + "</li>" +
    "<li>Executive Sponsor: " + exeSponsor + "</li>" +
    "</ul>",
    name:"Product Input Form"});
}
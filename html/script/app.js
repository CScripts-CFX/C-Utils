var inputType;

window.onload = (e) => {
  window.addEventListener("message", (event) => {
    var data = event.data;
    inputType = data.action;

    if (inputType === "input") {
      /* Inputs */
      $("#input-container .title").text(data.title);
      $("#submit").text(data.submit);
      $("#input").val(""); // This will reset the text in the input box
      $("#input").attr("type", data.isNumber ? "number" : "text"); // This will set the type of the input field

      if (data.isNumber) {
        $("#input").addClass("number-input");
      } else {
        $("#input").removeClass("number-input");
      }

      if (data.cancel) {
        $("#cancel").text(data.cancel);
        $("#cancel").show();
      } else {
        $("#cancel").hide();
      }

      $("#input-container").fadeIn(300);
    } else if (inputType == "open") {
      /* Prompts */
      $("#yes").text(data.yes);
      $("#no").text(data.no);
      $("#prompt-container .title").text(data.title);
      $("#prompt-container").fadeIn(300);
    } else if (inputType == "openLarge") {
      /* Large Input Box */
      if (!data.noWipe) {
        $("#large-input").val(""); // This will reset the text in the input box
      }

      if (data.autoFill) {
        $("#large-input").val(data.autoFill);
      }

      // Placeholder text
      if (data.placeholder) {
        $("#large-input").attr("placeholder", data.placeholder);
      }

      $("#large-submit").text(data.yes);

      if (data.no) {
        $("#large-cancel").text(data.no);
        $("#large-cancel").show();
      } else {
        $("#large-cancel").hide();
      }

      $("#large-input-container .title").text(data.title);
      $("#large-input-container").fadeIn(300);

      $("#large-input")
        .off("paste")
        .on("paste", function (event) {
          event.stopPropagation();

          var clipboardData =
            event.originalEvent.clipboardData || window.clipboardData;
          var pastedData = clipboardData.getData("text");

          if (isImgurURL(pastedData)) {
            event.preventDefault();
            var imageUrl = pastedData.trim();

            var currentValue = $(this).val();
            var updatedValue =
              currentValue +
              "\n" +
              imageUrl +
              "\n(Images need to be single-line and isolated)";
            $(this).val(updatedValue);
          }
        });
    } else if (inputType == "openLetter") {
      /* Letters */
      $("#read-container .title").text(data.title);
      $("#close-button").text(data.closeButton);

      if (data.isImage) {
        // If the content includes an image URL, split the text and display the image separately
        var lines = data.content.split("\n"); // Split content into separate lines

        // Process each line and append HTML accordingly
        var htmlContent = "";
        for (var i = 0; i < lines.length; i++) {
          var line = lines[i].trim();

          if (
            (line.startsWith("https://i.imgur.com/") &&
              line.endsWith(".png")) ||
            line.endsWith(".jpg") ||
            line.endsWith(".jpeg") ||
            line.endsWith(".gif")
          ) {
            // If the line is a single-line image, add the image with line breaks before and after
            var imageUrl = line;
            htmlContent +=
              "<br>" +
              '<img src="' +
              imageUrl +
              '" style="max-width: 100%; max-height: 300px;"><br>' +
              "<br>";
          } else if (line !== "") {
            // If the line is not empty, add the line of text
            htmlContent += line + "<br>";
          }
        }

        $("#letter-content").html(htmlContent);
      } else {
        // Otherwise, display the content as regular text
        $("#letter-content").text(data.content);
      }

      $("#read-container").fadeIn(300);
    }
  });
};

/* Large Inputs */
$("#large-submit").click(function (event) {
  var largeInputVal = $("#large-input").val();
  if (largeInputVal === "") {
    $("#input-warning").fadeIn(1000);
    $("#input-warning").text("Input cannot be empty.");
    setTimeout(function () {
      $("#input-warning").fadeOut(1000);
    }, 2000);
  } else {
    $("#large-input-container").fadeOut(300);
    $.post(
      "http://c-utils/sendLargeInput",
      JSON.stringify({ input: largeInputVal })
    );
    $("#large-input").val(""); // This will reset the text in the input box
  }
});

$("#large-cancel").click(function (event) {
  $("#large-input-container").fadeOut(300);
  $.post("http://c-utils/sendLargeInput", JSON.stringify({ input: false }));
});

/* Prompts */
$("#yes").click(function (event) {
  $("#prompt-container").fadeOut(300);
  $.post("http://c-utils/sendprompt", JSON.stringify({ prompt: true }));
});

$("#no").click(function (event) {
  $("#prompt-container").fadeOut(300);
  $.post("http://c-utils/sendprompt", JSON.stringify({ prompt: false }));
});

/* Inputs */
$("#submit").click(function () {
  var inputVal = $("#input").val();
  if (inputVal === "") {
    $("#input-warning").fadeIn(1000);
    $("#input-warning").text("Input cannot be empty.");
    setTimeout(function () {
      $("#input-warning").fadeOut(1000);
    }, 2000);
  } else {
    $.post(
      "http://c-utils/sendinput",
      JSON.stringify({ input: $("#input").val() })
    );
    $("#input-container").fadeOut(300);
  }
});

$("#cancel").click(function () {
  $.post("http://c-utils/sendinput", JSON.stringify({ input: false }));
  $("#input-container").fadeOut(300);
});

/* Read Letter */
$("#close-button").click(function (event) {
  $("#read-container").fadeOut(300);
  $.post("http://c-utils/sendCloseLetter");
});

// Helper function to check if a string is an Imgur URL
function isImgurURL(url) {
  return /^https?:\/\/i\.imgur\.com\/[\w-]+(\.(jpg|jpeg|png|gif))?$/i.test(url);
}

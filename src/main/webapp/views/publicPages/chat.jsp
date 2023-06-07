<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="../../config.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css">
<link rel="stylesheet" href="../css/chat.css">
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<script>
  $(document).ready(function () {
    $("#chat-close").click(function () {
      $("#chat-page-content").hide();
      $("#direct-chat-messages").empty();
    });
    $("#chat-show").click(function () {
      $("#chat-page-content").show();
    });

    $("#chat-send-msg").click(function () {
      var msg = $('#chat-msg-body').val();
      $('#chat-msg-body').val("");
      $("#direct-chat-messages").append("<div class=\"direct-chat-msg\">" +
          "<div class=\"direct-chat-info clearfix\">" +
          "<span class=\"direct-chat-name pull-left\">" +
          "<spring:message code="LocaleChatMyName" />" +
          "</span>" +
          "<span class=\"direct-chat-timestamp pull-right\">" +
          "</span></div><img class=\"direct-chat-img\" " +
          "src=\"https://img.icons8.com/color/36/000000/administrator-male.png\" " +
          "alt=\"message user image\">" +
          "<div class=\"direct-chat-text\">" +
            msg +
      "</div></div>");
      if (msg != null && msg.length > 3) {
        $.ajax({
          url: "https://api.openai.com/v1/chat/completions",
          beforeSend: function(request) {
            request.setRequestHeader("Accept", "application/json");
            request.setRequestHeader("Content-Type", "application/json");
            request.setRequestHeader("Authorization", "Bearer " + API_KEY);
          },
          method: 'POST',
          dataType: 'json',
          data: JSON.stringify({
            "model": "gpt-3.5-turbo",
            "messages": [
              {
                "role": "user",
                "content": msg
              }
            ]
          }),
          success: function(data){
            console.log('succes: '+data);
            $("#direct-chat-messages").append("<div class=\"direct-chat-msg right\">" +
                "<div class=\"direct-chat-info clearfix\">" +
                "<span class=\"direct-chat-name pull-right\"><spring:message code="LocaleChatAdminName" /></span>" +
                "<span class=\"direct-chat-timestamp pull-left\"></span></div>" +
                "<img class=\"direct-chat-img\" src=\"https://img.icons8.com/office/36/000000/person-female.png\"" +
                " alt=\"message user image\">" +
                "<div class=\"direct-chat-text\">" +
                data.choices[0].message.content +
                "</div></div>");
          }
        });
      }
    });
  });
</script>

<div>
    <div style="bottom: 70px;position: absolute;" class="page-content page-container" hidden="hidden"
         id="chat-page-content">
        <div class="padding">
            <div class="row container d-flex justify-content-center">
                <div class="col-md-4">
                    <div class="box box-warning direct-chat direct-chat-warning">
                        <div class="box-header with-border">
                            <h3 class="box-title"><spring:message code="LocaleChatName" /></h3>

                            <div class="box-tools pull-right">
                                <button id="chat-close" type="button" class="btn btn-box-tool"
                                        data-widget="remove">
                                    <i class="fa fa-times"></i>
                                </button>
                            </div>
                        </div>

                        <div class="box-body">

                            <div id="direct-chat-messages" class="direct-chat-messages">
                            </div>

                        </div>

                        <div class="box-footer">
                            <form action="#" method="post">
                                <div class="input-group">
                                    <input id="chat-msg-body" type="text" name="message"
                                           placeholder="Type Message ..."
                                           class="form-control">
                                    <span class="input-group-btn">
                            <button id="chat-send-msg" type="button"
                                    class="btn btn-warning btn-flat"><spring:message code="LocaleChatSend" /></button>
                          </span>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <button id="chat-show" style="position: fixed; left: 20px; padding: 10px; bottom: 70px"
            type="button"
            class="btn btn-default btn-lg">
        <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
    </button>
</div>


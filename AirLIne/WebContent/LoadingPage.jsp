<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <title>Payment_Processing</title>
</head>
<style>
    bodY {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
.center {
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  background: #000;
}
.wave {
  width: 5px;
  height: 100px;
  background: linear-gradient(45deg, cyan, #fff);
  margin: 10px;
  animation: wave 1s linear infinite;
  border-radius: 20px;
}
.wave:nth-child(2) {
  animation-delay: 0.1s;
}
.wave:nth-child(3) {
  animation-delay: 0.2s;
}
.wave:nth-child(4) {
  animation-delay: 0.3s;
}
.wave:nth-child(5) {
  animation-delay: 0.4s;
}
.wave:nth-child(6) {
  animation-delay: 0.5s;
}
.wave:nth-child(7) {
  animation-delay: 0.6s;
}
.wave:nth-child(8) {
  animation-delay: 0.7s;
}
.wave:nth-child(9) {
  animation-delay: 0.8s;
}
.wave:nth-child(10) {
  animation-delay: 0.9s;
}

@keyframes wave {
  0% {
    transform: scale(0);
  }
  50% {
    transform: scale(1);
  }
  100% {
    transform: scale(0);
  }
}




</style>
<script>
         setTimeout(myURL, 1000);
         function myURL(){
            open('TicketPreview.jsp');
         };

</script>
<body>
  <form action="TicketPreview.jsp" >
  
    <div class="center" >
   
        <div class="wave"></div>
        <div class="wave"></div>
        <div class="wave"></div>
        <div class="wave"></div>
        <div class="wave"></div>
        
        <h2 id="blink" style="color:white;">Payment Processing...</h2>
        <div class="wave"></div>
        <div class="wave"></div>
        <div class="wave"></div>
        <div class="wave"></div>
        <div class="wave"></div>
         
      </div>
    </form>
    <script type="text/javascript">
        var blink = document.getElementById('blink');
        setInterval(function() 
        		{
            blink.style.opacity = (blink.style.opacity == 0 ? 1 : 0);
        }, 80);
    </script>
</body>
</html>
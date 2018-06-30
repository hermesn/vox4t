<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>
<!--<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>-->

<script language="JavaScript" type="text/javascript">
   function mascaraData(campoData){
              var data = campoData.value;
              if (data.length == 2){
                  data = data + '/';
                  document.forms[0].data.value = data;
      return true;              
              }
              if (data.length == 5){
                  data = data + '/';
                  document.forms[0].data.value = data;
                  return true;
              }
         }
</script>

<style type="text/css">
*[role="form"] {
    padding: 15px;
    margin-top: 260px;
    margin-left: 220px;
    border-radius: 0.3em;
}

input.alinha {
    margin-left: 5em;
    margin-bottom: 1em;
}

</style>
  <title>Teste cadastro</title>
</head>
<body>
	
<div class="container">
            <form class="form-horizontal" role="form" method="post" action="save">
            <div>
		<p style="color: red; margin-left: 230px;">${msgSucesso}</p>
	</div>
                <div class="form-group">
                    <label for="firstName" class="col-sm-3 control-label">Nome</label>
                    <div class="col-sm-9">
                        <input type="text" name="nome" placeholder="Nome" class="form-control" style="width: 250px;" maxlength="45" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="col-sm-3 control-label">Email</label>
                    <div class="col-sm-9">
                        <input type="email" name="email" placeholder="Email" class="form-control" style="width: 250px;" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-3 control-label">Senha</label>
                    <div class="col-sm-9">
                        <input type="password" name="senha" placeholder="Senha" class="form-control" style="width: 250px;" minlength = "6" maxlength="45" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="confpassword" class="col-sm-3 control-label">Confirmar Senha</label>
                    <div class="col-sm-9">
                        <input type="password" placeholder="Confirmar senha" class="form-control" style="width: 250px;" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="date" class="col-sm-3 control-label">Data de Nascimento</label>
                    <div class="col-sm-9">
                         <input type="text" name="dataNascimento" OnKeyUp="mascaraData(this);" class="form-control" style="width: 250px;" placeholder="Data de nascimento" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-3">Genero</label>
                    <div class="col-sm-6">
                        <div class="row">
                            <div class="col-sm-4">
                                <label class="radio-inline"><input type="radio" name="sexo" value="F" required>Feminino</label>   
                            </div>
                            <div class="col-sm-4">
                                <label class="radio-inline"><input type="radio" name="sexo" value="M">Masculino</label>        
                            </div>
                            <div class="col-sm-4">
                                <label class="radio-inline"><input type="radio" name="sexo" value="O"> Outros</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-3" style="margin-left: 50px;">
                        <button type="submit" style="width: 150px; margin-left: 220px;" class="btn btn-primary btn-block">Cadastrar</button>
                    </div>
                </div>
            </form> 
        </div> 
</body>
</html>
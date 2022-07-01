class ModelLogin {

  String email, password = "";
  String? name, token;
  dynamic context;

  ModelLogin( this.email, this.password, { this.name, this.token, this.context } );

}
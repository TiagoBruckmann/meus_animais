// imports nativos
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

// import dos eventos
import 'package:meus_animais/data/sources/remote/services/events.dart';

class PolicyPage extends StatelessWidget {
  const PolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EventsApp().sendScreen("policy");
    return Scaffold(
      appBar: AppBar(
        leading: null,
        title: const Text("Política de privacidade"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 20),
        child: Column(
          children: [

            // cabeçalho
            const ListTile(
              title: Text("POLÍTICA DE PRIVACIDADE"),
              subtitle: Text("Atualizado em 29 de Julho de 2022"),
            ),

            Text.rich(
              TextSpan(
                text: "Nossa política de privacidade tem por objetivo auxiliá-los em nossas práticas de dados, como as informações que tratamos para fornecer nossos serviços. Nossa política de privacidade mostra quais dados são coletados sobre você e como isso lhe afeta, ela também explica as medidas que tomamos para proteger sua privacidade.\n\n",
                style: const TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 15,
                ),
                children: [
                  const TextSpan(
                    text: "Leia também nossos ",
                  ),
                  TextSpan(
                    text: "Termos de uso",
                    style: const TextStyle(
                      color: Colors.lightBlue,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () {
                      EventsApp().sharedEvent("policy_open_terms");
                      Navigator.pushNamed(
                        context,
                        "/terms",
                      );
                    },
                  ),
                  const TextSpan(
                    text: ", que descrevem os termos que regulam o fornecimento e o uso que você faz de nossos serviços.\n\n",
                  ),
                ],
              ),
            ),

            // Sobre nossos serviços
            const ListTile(
              title: Padding(
                padding: EdgeInsets.only( bottom: 10 ),
                child: Text(
                  "Sobre nossos serviços\n",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              subtitle: Text.rich(
                // seguranca
                TextSpan(
                  text: "Meus animais ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  children: [
                    TextSpan(
                      text: "necessitam receber ou solicitar algumas informações para operar de maneira correta.\n\n",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 15,
                      ),
                      children: [
                        TextSpan(
                          text: "Os dados solicitados e recebidos são padrões para todos os usuários.\n\n",
                        ),
                      ],
                    ),

                    // dados fornecidos pelos usuarios
                    TextSpan(
                      text: "Dados fornecidos pelos usuários:\n\n",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                      children: [
                        TextSpan(
                          text: "Dados referentes ao dono da conta: ",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                          children: [
                            TextSpan(
                              text: "É preciso informar alguns dados básicos, como Nome, Email e Senha (Nome este que pode ser escolhido por você) para que seja possível cadastrar sua conta. Caso estes dados não sejam informados sua conta não poderá ser cadastrada!\n\n",
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),

                        TextSpan(
                          text: "Dados referentes aos animais de estimação: ",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                          children: [
                            TextSpan(
                              text: "São dados específicos para publicação de um animal de estimação, onde é necessário informar algumas informações básicas para cada um que for cadastrado. Estas informações variam de Nome, imagem, data de nascimento e mais algumas solicitadas no aplicativo.\n\n",
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),

                        TextSpan(
                          text: "Dados referentes às vacinas: ",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                          children: [
                            TextSpan(
                              text: "As vacinas podem ser cadastradas de forma individual ou em pares, porém os dados são os mesmos para ambos os jeitos, suas informações também podem variar! Indo desde nome, reaplicação e demais informações.\n\n",
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                              ),
                              children: [
                                TextSpan(
                                  text: " - Os dados referentes à revacinação informam os dias e o tipo de tempo, onde este conjunto de informação é utilizado para envio de notificações e lembretes de revacinação.\n\n",
                                ),
                              ],
                            ),
                          ],
                        ),

                        TextSpan(
                          text: "Dados referentes a higiene: ",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                          children: [
                            TextSpan(
                              text: "Todos os dados referentes a higiene do pet são obrigatórios, porém também possuem uma variação de campos.\n\n",
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),

                  ],
                ),
              ),
            ),

            // dados coletados automaticamente
            const ListTile(
              title: Padding(
                padding: EdgeInsets.only( bottom: 10 ),
                child: Text(
                  "Dados coletados automaticamente:\n",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
              subtitle: Text.rich(

                TextSpan(
                  text: "Dados de uso e de registro: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                  children: [
                    TextSpan(
                      text: "Coletamos todos os dados sobre a sua atividade e nossos serviços, como análise de tráfego, diagnóstico de desempenho, diagnósticos de erros e arquivos de registros. Essas coletas incluem dados sobre sua atividade, (inclusive o tempo gasto no aplicativo, frequência de utilização, duração de suas atividades e interações).\n\n",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 15,
                      ),
                    ),

                    TextSpan(
                      text: "Dados sobre conexões e dispositivos: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                      children: [
                        TextSpan(
                          text: "Coletamos dados específicos sobre conexões e dispositivos de quando você instalou o aplicativo, acessou e utilizou nossos recursos. Estas informações incluem modelo do hardware do seu dispositivo, informação de sistema operacional, versão do aplicativo, se é rede móvel ou wi-fi,  nível de API do sistema operacional, operadora de telefonia e localização do dispositivo.\n\n",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),

                    TextSpan(
                      text: "Armazenamento local: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                      children: [
                        TextSpan(
                          text: "Utilizamos armazenamento local para salvar algumas informações pertinentes somente ao usuário enquanto conectado, estes dados são referentes às credenciais de acesso.\n\n",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),

            // como utilizamos suas informacoes
            const ListTile(
              title: Padding(
                padding: EdgeInsets.only( bottom: 10 ),
                child: Text(
                  "Como utilizamos suas informações:\n",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              subtitle: Text.rich(
                // seguranca
                TextSpan(
                  text: "Utilizamos suas informações para tomadas de decisões internas, sobre quais funcionalidades precisam de melhorias ou mais atenção, análise de falhas, aprimoramento e correção do aplicativo. ",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 15,
                  ),
                  children: [

                    // dados fornecidos pelos usuarios
                    TextSpan(
                      text: "Nossos serviços: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                      children: [
                        TextSpan(
                          text: "Utilizamos os dados que temos para fornecer melhorias e organização dos cuidados dos animais de estimação. Utilizamos também para melhor compreender a utilização dos nossos serviços, assim como para efetuar avaliações e aprimorações, pesquisar, desenvolver e testar novos recursos e solucionar problemas existentes. Também é utilizado caso você entre em contato conosco em um eventual problema ou solicitação de suporte.\n\n",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 15,
                          ),
                        ),

                        TextSpan(
                          text: "Comunicação sobre nossos serviços: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                          children: [
                            TextSpan(
                              text: "Utilizamos os dados que temos para entrar em contato com você para informar de possíveis alterações de termos de uso, política de privacidade e demais atualizações importantes, podemos enviar também notificações sobre nossos serviços ou atualizações.\n\n",
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Informações que você e nós compartilhamos
            const ListTile(
              title: Padding(
                padding: EdgeInsets.only( bottom: 10 ),
                child: Text(
                  "Informações que você e nós compartilhamos:\n",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              subtitle: Text.rich(
                // seguranca
                TextSpan(
                  text: "Você compartilha informações a medida que utiliza nossos serviços e nós em momento algum compartilhamos suas informações com terceiros! \n\n",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 15,
                  ),
                  children: [

                    TextSpan(
                      text: "Dados associados a sua conta: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                      children: [
                        TextSpan(
                          text: "Seu nome e demais informações básicas pessoais ou do seu animal de estimação estão disponíveis apenas e unicamente para você.\n\n",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 15,
                          ),
                        ),

                        TextSpan(
                          text: "Empresas no Meus Animais: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                          children: [
                            TextSpan(
                              text: "É possível que alguma empresa venha a utilizar nossos serviços, algo que ",
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                              ),
                            ),
                            TextSpan(
                              text: "não é proibido! ",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            TextSpan(
                              text: "porém os dados se mantêm os mesmos e ",
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                              ),
                            ),
                            TextSpan(
                              text: "não nos responsabilizamos ",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            TextSpan(
                              text: "pelo uso indevido dos mesmos, assim como o possível compartilhamento que está empresa efetue.\n\n",
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Cessão, alteração ou transferência de controle
            const ListTile(
              title: Padding(
                padding: EdgeInsets.only( bottom: 10 ),
                child: Text(
                  "Cessão, alteração ou transferência de controle:\n",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              subtitle: Text.rich(
                // seguranca
                TextSpan(
                  text: "Caso efetuemos uma fusão, aquisição, reestruturação, falência ou venda de todos ou alguns de nossos ativos, compartilharemos com as entidades sucessoras ou com os novos proprietários os dados relacionados de acordo com as leis aplicáveis de proteção de dados.\n\n",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 15,
                  ),
                ),
              ),
            ),

            // Gerenciamento e manutenção de seus dados
            const ListTile(
              title: Padding(
                padding: EdgeInsets.only( bottom: 10 ),
                child: Text(
                  "Gerenciamento e manutenção de seus dados:\n",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              subtitle: Text.rich(
                // seguranca
                TextSpan(
                  text: "Você pode solicitar seus dados utilizando nosso recurso “Solicitar informações da conta” (Abra o ",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 15,
                  ),
                  children: [

                    TextSpan(
                      text: "Meus Animais ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      children: [
                        TextSpan(
                          text: "e clique em Configurações e então > Solicitar informações da conta).\n\n",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 15,
                          ),
                        ),

                      ],
                    ),

                    TextSpan(
                      text: "Alteração de informações do usuário: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      children: [
                        TextSpan(
                          text: "Se for solicitado para alterar o E-mail você precisará efetuar uma dupla autenticação do e-mail antigo e do novo, para evitar que a conta seja transferida para a conta de outra pessoa. É possível alterar seu nome e foto de perfil a qualquer momento.\n\n",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),

                    TextSpan(
                      text: "Apagar sua conta: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      children: [
                        TextSpan(
                          text: "É possível apagar sua conta a qualquer momento, inclusive isso revoga totalmente o consentimento de seus dados por nós de acordo com as leis aplicáveis, com a opção “Excluir minha conta”. Quando sua conta é deletada todas as suas informações também são utilizadas de modo que tudo acaba sendo criptografado.\n\n",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                          ),
                        ),

                        TextSpan(
                          text: "Observação: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                          children: [
                            TextSpan(
                              text: "Caso o aplicativo apenas seja desinstalado sem efetuar o uso da função ",
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                              ),
                              children: [
                                TextSpan(
                                  text: "“Excluir minha conta” ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                TextSpan(
                                  text: "todos os dados se mantêm armazenados conosco da mesma maneira, até o momento onde um período de inatividade prolongado pode vir a coletar suas informações.\n\n",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                      ],
                    ),

                  ],
                ),
              ),
            ),

            // Alterações da nossa política
            const ListTile(
              title: Padding(
                padding: EdgeInsets.only( bottom: 10 ),
                child: Text(
                  "Alterações da nossa política:\n",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              subtitle: Text.rich(
                // seguranca
                TextSpan(
                  text: "Podemos alterar ou atualizar nossa política de privacidade e termos de uso. Você receberá uma notificação sobre as alterações feitas nesta política de privacidade ou nos termos de uso e será solicitado para aceitar novamente ao abrir o aplicativo. Toda a vez que nossa política ou termos são atualizados é alterada a data de atualização no início desta documentação.\n\n",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 15,
                  ),
                ),
              ),
            ),

            // LGPD
            const ListTile(
              title: Padding(
                padding: EdgeInsets.only( bottom: 10 ),
                child: Text(
                  "Lei Geral de Proteção de Dados do Brasil - LGPD:\n",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              subtitle: Text.rich(
                // seguranca
                TextSpan(
                  text: "Para saber sobre todos os seus direitos e em como exercê-los sob a lei LGPD, ",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 15,
                  ),
                  children: [
                    TextSpan(
                      text: "clique aqui.\n\n",
                      style: TextStyle(
                        color: Colors.lightBlue,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Entre em contato conosco
            const ListTile(
              title: Padding(
                padding: EdgeInsets.only( bottom: 10 ),
                child: Text(
                  "Entre em contato conosco:\n",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              subtitle: Text.rich(
                // seguranca
                TextSpan(
                  text: "Em caso de dúvidas ou questões sobre está politica ou nossos termos de uso, entre em contato conosco via e-mail.\n\n",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 15,
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

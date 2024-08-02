// imports nativos
import 'package:flutter/material.dart';

// import das telas
import 'package:meus_animais/app/pages/terms/widgets/title_text.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: null,
        title: const Text("Termos de uso"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 20),
        child: Column(
          children: [

            // cabeçalho
            const ListTile(
              title: Text("TERMO DE USO MEUS ANIMAIS"),
              subtitle: Text("Atualizado em 29 de Julho de 2022"),
            ),

            // sobre nossos servicos
            ListTile(
              title: const Padding(
                padding: EdgeInsets.only( bottom: 10 ),
                child: TitleTextWidget(
                  title: "Sobre nossos serviços",
                ),
              ),
              subtitle: Text.rich(
                TextSpan(
                  text: "Segurança e privacidade:\n\n",
                  style: theme.textTheme.bodyLarge?.apply(
                    fontWeightDelta: 5,
                  ),
                  children: [

                    TextSpan(
                      text: "- Desenvolvemos nosso sistema de forma segura e pensando na confiabilidade e privacidade.\n\n",
                      style: theme.textTheme.bodyLarge?.apply(
                        fontWeightDelta: -3,
                      ),
                    ),

                    // formas de melhoria
                    TextSpan(
                      text: "Formas de melhorar nosso sistema:\n\n",
                      style: theme.textTheme.bodyLarge?.apply(
                        fontWeightDelta: 5,
                      ),
                      children: [

                        TextSpan(
                          text: "- Utilizamos nossas métricas para prever e ter estudos de sequência e utilização dos nossos usuários, a fim de sempre buscarmos melhorar a sua experiência.\n\n"
                              "- Buscamos sempre dar ouvidos às suas contribuições, sejam elas via avaliação da loja ou via dicas e sugestões internas do aplicativo.\n\n",
                          style: theme.textTheme.bodyLarge?.apply(
                            fontWeightDelta: -3,
                          ),
                        ),

                        // acessos
                        TextSpan(
                          text: "Acessos a nossos serviços:\n\n",
                          style: theme.textTheme.bodyLarge?.apply(
                            fontWeightDelta: 5,
                          ),
                          children: [

                            TextSpan(
                              text: "- Para que seja possível o nosso sistema estar disponível em diversos lugares do mundo, utilizamos serviços em diversos lugares do globo, sempre visando a maior integridade de nosso sistema.\n\n",
                              style: theme.textTheme.bodyLarge?.apply(
                                fontWeightDelta: -3,
                              ),
                            ),

                          ],
                        ),

                        // permissoes
                        TextSpan(
                          text: "Permissões necessárias:\n\n",
                          style: theme.textTheme.bodyLarge?.apply(
                            fontWeightDelta: 5,
                          ),
                          children: [

                            TextSpan(
                              text: "- Nosso sistema não necessita de nenhuma permissão exclusiva como por exemplo acesso a Localização ou Agenda de contatos.\n\n",
                              style: theme.textTheme.bodyLarge?.apply(
                                fontWeightDelta: -3,
                              ),
                            ),

                          ],
                        ),

                        // utilizacao
                        TextSpan(
                          text: "Utilização:\n\n",
                          style: theme.textTheme.bodyLarge?.apply(
                            fontWeightDelta: 5,
                          ),
                          children: [

                            TextSpan(
                              text: "- Nosso sistema não possui nenhum embargo ou serviços que seja necessário uma faixa etária mínima, logo sua utilização pode ser feita por pessoas de qualquer idade.\n\n",
                              style: theme.textTheme.bodyLarge?.apply(
                                fontWeightDelta: -3,
                              ),
                            ),

                          ],
                        ),

                        // dispositivos
                        TextSpan(
                          text: "Dispositivos e software:\n\n",
                          style: theme.textTheme.bodyLarge?.apply(
                            fontWeightDelta: 5,
                          ),
                          children: [

                            TextSpan(
                              text: "- Para a utilização o usuário precisará possuir certos dispositivos, softwares ou conexões de dados mínimos, os quais ",
                              style: theme.textTheme.bodyLarge?.apply(
                                fontWeightDelta: -3,
                              ),
                            ),

                            TextSpan(
                              text: "não são ",
                              style: theme.textTheme.bodyLarge?.apply(
                                fontWeightDelta: 5,
                              ),
                            ),

                            TextSpan(
                              text: "disponibilizados pela ",
                              style: theme.textTheme.bodyLarge?.apply(
                                fontWeightDelta: -3,
                              ),
                            ),

                            TextSpan(
                              text: "Meus Animais.\n\n",
                              style: theme.textTheme.bodyLarge?.apply(
                                fontWeightDelta: 5,
                              ),
                            ),

                          ],
                        ),

                        // tarifas
                        TextSpan(
                          text: "Tarifas e custos:\n\n",
                          style: theme.textTheme.bodyLarge?.apply(
                            fontWeightDelta: 5,
                          ),
                          children: [

                            TextSpan(
                              text: "- Nosso sistema não possui nenhum tipo de venda de pacotes, porém para efetuar sua utilização é necessário ter acesso a internet seja via Wi-fi ou Dados móveis, e estes custos são de total responsabilidade do utilizador.\n\n",
                              style: theme.textTheme.bodyLarge?.apply(
                                fontWeightDelta: -3,
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

            // servicos terceiros
            ListTile(
              title: Text(
                "Sobre serviços terceiros\n",
                style: theme.textTheme.displayMedium,
              ),
              subtitle: Text.rich(
                TextSpan(
                  text: "Nosso sistema não faz a utilização de nenhum serviço terceiro, todas as funcionalidades e opções existentes no aplicativo foram construídas e são gerenciadas pela própria equipe de ",
                  style: theme.textTheme.bodyLarge?.apply(
                    fontWeightDelta: -3,
                  ),
                  children: [

                    TextSpan(
                      text: "Meus animais.",
                      style: theme.textTheme.bodyLarge?.apply(
                        fontWeightDelta: 5,
                      ),
                    ),

                  ],
                ),
              ),
            ),

            // avisos legais e insecoes
            const ListTile(
              title: Padding(
                padding: EdgeInsets.only( bottom: 10 ),
                child: TitleTextWidget(
                  title: "\nAvisos legais e Isenções\n",
                ),
              ),
              subtitle: Text(
                  "- O uso de nosso serviço é por sua conta e risco.\n\n"
                      "- Nossos serviços são como eles se apresentam, sem garantias expressas ou tácitas incluindo garantias de comercialidade, adequação a um fim de propriedade específico.\n\n"
                      "- Não nos responsabilizamos por violação e proteção contra vírus de computador ou outros códigos nocivos.\n\n"
                      "- Não garantimos que nossos serviços estejam operantes 24/7, sem interrupções, atrasos ou imperfeições.\n\n"
                      "- Não controlamos e não nos responsabilizamos quando ou como nossos usuários utilizam nossos serviços ou recursos.\n\n"
              ),
            ),

            // disponibilidade e rescisao
            ListTile(
              title: const Padding(
                padding: EdgeInsets.only( bottom: 10 ),
                child: TitleTextWidget(
                  title: "Disponibilidade e rescisão de serviços\n",
                ),
              ),
              subtitle: Text.rich(
                TextSpan(
                  text: "Disponibilidade de nossos serviços:\n\n",
                  style: theme.textTheme.bodyLarge?.apply(
                    fontWeightDelta: 5,
                  ),
                  children: [

                    TextSpan(
                      text: "- Estamos sempre à procura de aprimorar nossos serviços, isso podemos ampliar, adicionar ou remover algum serviço, recurso, funcionalidade ou compatibilidade com algum dispositivo ou plataforma.\n\n",
                      style: theme.textTheme.bodyLarge?.apply(
                        fontWeightDelta: -3,
                      ),
                      children: const [

                        TextSpan(
                          text: "- Nossos serviços podem ser interrompidos para efetuação de manutenções, reparos, atualizações, falhas de rede ou de equipamentos.\n\n",
                        ),

                        TextSpan(
                          text: "- Podemos descontinuar alguns ou todos os nossos serviços, inclusive determinados recursos e suporte a plataformas ou aparelhos.\n\n",
                        ),

                      ],
                    ),

                    // rescisao
                    TextSpan(
                      text: "Rescisão:\n\n",
                      style: theme.textTheme.bodyLarge?.apply(
                        fontWeightDelta: 5,
                      ),
                      children: [

                        TextSpan(
                          text: "- Embora esperamos que nossos usuários nunca deixem de utilizar nosso aplicativo e de seus serviços, existe a possibilidade de encerrar seu relacionamento para com a ",
                          style: theme.textTheme.bodyLarge?.apply(
                            fontWeightDelta: -3,
                          ),
                        ),

                        TextSpan(
                          text: "Meus animais ",
                          style: theme.textTheme.bodyLarge?.apply(
                            fontWeightDelta: 5,
                          ),
                        ),

                        TextSpan(
                          text: "a qualquer momento que seja da vontade do usuário, podendo optar por apenas parar de utilizar nossos serviços ou podendo deletar sua conta e todos os seus dados de nosso sistema.\n\n",
                          style: theme.textTheme.bodyLarge?.apply(
                            fontWeightDelta: -3,
                          ),
                        ),

                        TextSpan(
                          text: "- Podemos acabar desativando sua conta caso ela não possua utilização ou não tenha alterações após um prolongado período.\n\n",
                          style: theme.textTheme.bodyLarge?.apply(
                            fontWeightDelta: -3,
                          ),
                        ),

                      ],
                    ),

                  ],
                ),
              ),
            ),

            // disposicao geral
            ListTile(
              title: const Padding(
                padding: EdgeInsets.only( bottom: 10 ),
                child: TitleTextWidget(
                  title: "Disposição geral\n",
                ),
              ),
              subtitle: Text.rich(
                TextSpan(
                  text: "- Reservamo-nos o direito de declarar futuramente que alguns de nossos serviços são governados por termos separados. (deverá ser aceito separadamente, se aplicados).\n\n",
                  style: theme.textTheme.bodyLarge?.apply(
                    fontWeightDelta: -3,
                  ),
                  children: const [

                    TextSpan(
                      text: "- Reservamo-nos o direito de alterar ou adicionar um adendo em nossos termos de uso já existentes. (deverá ser confirmado novamente o aceite dos termos).\n\n",
                      children: [

                        TextSpan(
                          text: "- Nossos termos foram elaborados em Portugues (Brasil). As versões traduzidas para outros idiomas são fornecidas apenas para sua conveniência e caso haja conflito entre a versão traduzida e nossos termos em Portugues, prevalecerão. Qualquer alteração ou renúncia que você proponha aos nossos Termos requer a nossa autorização expressa.\n\n",
                        ),

                        TextSpan(
                          text: "- Se deixarmos de impor alguma cláusula destes termos, isso não será considerado uma renúncia de direito.\n\n",
                        ),

                        TextSpan(
                          text: "- Seus comentários ou sugestões sobre o app e nossos serviços são sempre bem-vindos, mas entenda que você não é obrigado a enviar comentários e sugestões e, ainda que venha a contribuir, podemos utilizá-los sem qualquer restrição ou obrigação de remunerar o usuário por eles.\n\n",
                        ),

                      ],
                    ),

                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laborus_app/providers/step_provide.dart';
import 'package:provider/provider.dart';

class StepPage3 extends StatefulWidget {
  const StepPage3({super.key});

  @override
  State<StepPage3> createState() => _StepPage3State();
}

class _StepPage3State extends State<StepPage3> {
  bool _agreedToTerms = false;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<StepProvider>(context, listen: false)
          .changeText('Política de Privacidades');
    });

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.center,
              child:  const Text(
                '''
    Na LABORUS, privacidade e segurança são prioridades e nos comprometemos com a transparência do tratamento de dados pessoais dos nossos usuários/clientes. Por isso, esta presente Política de Privacidade estabelece como é feita a coleta, uso e transferência de informações de clientes ou outras pessoas que acessam ou usam nosso aplicativo.
    
    Ao utilizar nossos serviços, você entende que coletaremos e usaremos suas informações pessoais nas formas descritas nesta Política, sob as normas de Proteção de Dados (LGPD, Lei Federal 13.709/2018), das disposições consumeristas da Lei Federal 8078/1990 e as demais normas do ordenamento jurídico brasileiro aplicáveis.
    Dessa forma, a Laborus, inscrita no CNPJ/MF sob o nº xx.xxx.xxx/xxxx-xx obriga-se ao disposto na presente Política de Privacidade.
    
    1. Quais dados coletamos sobre você e para qual finalidade?Nosso site coleta e utiliza alguns dados pessoais seus, de forma a viabilizar a prestação de serviços e aprimorar a experiência de uso.
    2.1. Consentimento:
    
    É a partir do seu consentimento que tratamos os seus dados pessoais. O consentimento é a manifestação livre, informada e inequívoca pela qual você autoriza a Controlare a tratar seus dados.
    Assim, em consonância com a Lei Geral de Proteção de Dados, seus dados só serão coletados, tratados e armazenados mediante prévio e expresso consentimento.
    O seu consentimento será obtido de forma específica para cada finalidade acima descrita, evidenciando o compromisso de transparência e boa-fé da Laborus para com seus usuários/clientes, seguindo as regulações legislativas pertinentes.
    
    Ao utilizar os serviços da LABORUS e fornecer seus dados pessoais, você está ciente e consentindo com as disposições desta Política de Privacidade, além de conhecer seus direitos e como exercê-los.
    A qualquer tempo e sem nenhum custo, você poderá revogar seu consentimento.
    É importante destacar que a revogação do consentimento para o tratamento dos dados pode implicar a impossibilidade da performance adequada de alguma funcionalidade do site que dependa da operação. Tais consequências serão informadas previamente.
    
    3. Quais são os seus direitos?
    
    A Laborus assegura a seus usuários/clientes seus direitos de titular previstos no artigo 18 da Lei Geral de Proteção de Dados. Dessa forma, você pode, de maneira gratuita e a qualquer tempo:
    
    Confirmar a existência de tratamento de dados, de maneira simplificada ou em formato claro e completo. Acessar seus dados, podendo solicitá-los em uma cópia legível sob forma impressa ou por meio eletrônico, seguro e idôneo.
    Corrigir seus dados, ao solicitar a edição, correção ou atualização destes. Limitar seus dados quando desnecessários, excessivos ou tratados em desconformidade com a legislação através da anonimização, bloqueio ou eliminação.
    Solicitar a portabilidade de seus dados, através de um relatório de dados cadastrais que a Laborus trata a seu respeito.
    Eliminar seus dados tratados a partir de seu consentimento, exceto nos casos previstos em lei.Revogar seu consentimento, desautorizando o tratamento de seus dados.
    Informar-se sobre a possibilidade de não fornecer seu consentimento e sobre as consequências da negativa...
    A Laborus disponibiliza os seguintes meios para que você possa entrar em contato conosco: 

    E-mail: Laborus.Projeto@gmail.com
    Instagram: @laborus_
    ''',
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  value: _agreedToTerms,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _agreedToTerms = newValue ?? false;
                    });
                  },
                ),
                const Text('Concordo com os termos'),
              ],
            ),
            ElevatedButton(
              onPressed: _agreedToTerms
                  ? () {
                      Provider.of<StepProvider>(context, listen: false)
                          .addData();
                      context.goNamed('sucess');
                    }
                  : null,
              child: Container(
                alignment: Alignment.center,
                child: const Text('Próximo'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

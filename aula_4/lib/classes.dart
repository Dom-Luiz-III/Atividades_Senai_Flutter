class Carro {
  // Campos (variáveis) da classe
  String marca;
  String modelo;
  int ano;

  // Construtor(es)
  Carro(this.marca, this.modelo, this.ano);

  // Métodos da classe
  void acelerar(){
    print('O $marca $modelo está acelerando!');
  }

  void frear(){
    print('O $marca $modelo está freando!');
  }

  // void dados(){
  //   Carro carro1 = Carro('Corolla', 'Toyota', 2022);
  //   carro1.acelerar();
  //   carro1.frear();

  //   Carro carro2 = Carro('Uno', 'FIAT', 2016);
  //   carro2.acelerar();
  //   carro2.frear();
  // }
}
import 'dart:math';

class Genetics {
  getRandom(int m) {
    Random random = new Random();
    return random.nextInt(m);
  }

  probability(var deltas) {
    var SumDeltas = deltas.fold(0, (value, piece) => value + (1 / piece));
    return deltas.map((e) => (1 / e) / SumDeltas);
  }

  startPopulation(int oSize, int tSize, int max) {
    return new List<int>.filled(oSize, 0).map((e) =>
        new List<int>.filled(tSize, 0).map((_) => this.getRandom(max)));
  }

  int fitness(var gen, var t, int l) {
    int x = 0;
    var value = 0;
    gen.forEach((piece) {
      value += (piece * t[x]);
      x++;
      return value;
    });
    return (l - value).abs();
  }

  roulette(participants, numWins) {
    return new List.filled(numWins, null).map((e) => this.weightedRandom(participants));
  }

  mixGene(List<dynamic> nodes) {
    var parentA = nodes[0];
    var parentB = nodes[1];
    var mid = (parentA.toList().length / 2).floor();
  }

  mutation(var gen, value, double probability) {
    Random randomIns = new Random();
    var r = randomIns.nextDouble();
    var index = this.getRandom(gen.length);

    if (probability >= r) {
      int i = -1;
      return gen.map((piece) {
        i++;
        return i == index ? value : piece;
      });
    }
    return gen;
  }

  equation({List<int> equation, populationSize, maxIterations = 20}) {
    var y = equation.removeLast();
    var max = (y / 2).ceil();
    var population = this.startPopulation(populationSize, equation.length, max);

    while (maxIterations > 0) {
      maxIterations--;
      var deltas = population.map((gene) => this.fitness(gene, equation, y));
      var result = deltas.where((d) => d == 0).toList();
      if (result.length != 0) {
        return population.toList()[result[0]];
      }
      var probabilities = this.probability(deltas).toList();
      var pi = -1;
      var rouletteParticipants = new List();
      population.forEach((e) {
        var map = new Map();
        pi++;
        map = e;
        map = probabilities[pi];
        rouletteParticipants.add(map);
      });

      population = [];
      for (var i = 0; i < populationSize / 2; i++) {
        var bestGenes = this.roulette(rouletteParticipants, 2);
        var mixedGenes = this.mixGene(bestGenes.toList());
        var mutatedGenes = mixedGenes.map(
                (gene) => this.mutation(gene, this.getRandom(max), 0.1));
        population..addAll(mutatedGenes);
      }
    }
    return population;
  }
}

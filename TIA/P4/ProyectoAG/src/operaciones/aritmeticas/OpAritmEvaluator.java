package operaciones.aritmeticas;

import java.util.ArrayList;
import org.opt4j.core.Objectives;
import org.opt4j.core.Objective.Sign;
import org.opt4j.core.problem.Evaluator;

public class OpAritmEvaluator implements Evaluator<ArrayList<MathematicalSymbol>>{


	public Objectives evaluate(ArrayList<MathematicalSymbol> phenotype) {
		
		int resultado = Data.numeros[0];
		int numSUM = 0;
		
		for(int i = 0; i < phenotype.size(); i++)
		{
			switch (phenotype.get(i)) {
			case PLUS:
				resultado += Data.numeros[i+1];
				numSUM++;
				break;
			
			case MINUS:
				resultado -= Data.numeros[i+1];
				break;
				
			case MULT:
				resultado *= Data.numeros[i+1];
				break;
				
			case DIV:
				resultado /= Data.numeros[i+1];
				break;

			}
		}
		
	//Si hay un individuo que no cumple las condiciones, le ponemos un valor de fitness no deseado
		
	Objectives objectives = new Objectives();
	objectives.add("Valor objetivo-MIN", Sign.MIN, Math.abs(Data.resObj - resultado));
	objectives.add("Cuenta de +", Sign.MAX, numSUM);
	return objectives;
	}
}

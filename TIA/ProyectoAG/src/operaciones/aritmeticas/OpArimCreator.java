package operaciones.aritmeticas;

import java.util.Random;

import org.opt4j.core.genotype.SelectGenotype;
import org.opt4j.core.problem.Creator;

public class OpArimCreator implements Creator<SelectGenotype<MathematicalSymbol>>{
	
	public SelectGenotype<MathematicalSymbol> create()
	{
		MathematicalSymbol[] Symbols = {
				MathematicalSymbol.PLUS,
				MathematicalSymbol.MINUS,
				MathematicalSymbol.MULT,
				MathematicalSymbol.DIV
				};
		SelectGenotype<MathematicalSymbol> genotype = new SelectGenotype<MathematicalSymbol>(Symbols);
		
		genotype.init(new Random(), Data.numSimb);
		
		return genotype;
	}
	
}

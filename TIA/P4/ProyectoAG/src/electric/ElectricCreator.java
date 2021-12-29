package electric;

import java.util.Random;

import org.opt4j.core.genotype.IntegerGenotype;
import org.opt4j.core.problem.Creator;

public class ElectricCreator implements Creator<IntegerGenotype>
{
	public IntegerGenotype create() {
	IntegerGenotype genotype = new IntegerGenotype(0, DatosElectricidad.NUM_TRAMOS);
	
	genotype.init(new Random(), DatosElectricidad.NUM_PEDIDOS);
	
	return genotype;
	}
}

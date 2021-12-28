package electric;

import java.util.ArrayList;

import org.opt4j.core.genotype.IntegerGenotype;
import org.opt4j.core.problem.Decoder;

public class ElectricDecoder implements Decoder<IntegerGenotype, ArrayList<Integer>>
{
	public ArrayList<Integer> decode (IntegerGenotype genotype)
	{
		ArrayList<Integer> phenotype = new ArrayList<Integer>(DatosElectricidad.NUM_PEDIDOS);
		for(int i = 0 ; i < genotype.size() ; i++)
		{
			phenotype.add(genotype.get(i));
		}
		
		return phenotype;
	}
}

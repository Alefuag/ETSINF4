package electric;

import java.util.ArrayList;

import org.opt4j.core.Objectives;
import org.opt4j.core.Objective.Sign;
import org.opt4j.core.problem.Evaluator;

public class ElectricEvaluator implements Evaluator<ArrayList<Integer>>
{
	public Objectives evaluate(ArrayList<Integer> phenotype) {
		
		double beneficioTotal = 0;
		int numProd = 0;
		double[] potenciaConsumida = {0,0,0,0};
		int tramo;
		
		for(int i = 0 ; i < phenotype.size() ; i++)
		{
			tramo = phenotype.get(i);
			if (tramo != 0 && potenciaConsumida[tramo] + DatosElectricidad.consumo[i] > DatosElectricidad.potenciaMaximaTramo[tramo] )
			{
				beneficioTotal = Integer.MIN_VALUE;
				break;
			}
			if(tramo != 0)
			{
				if (tramo == 1 || tramo == 2) {numProd++;}
				
				potenciaConsumida[tramo] += DatosElectricidad.consumo[i];
				beneficioTotal += DatosElectricidad.beneficio[i] - (DatosElectricidad.consumo[i]*
																	DatosElectricidad.preciokWhTramo[tramo]*
																	(double) DatosElectricidad.horasTramo[tramo]);
			}
		}
		
		Objectives objectives = new Objectives();
		objectives.add("Beneficio Total", Sign.MAX, beneficioTotal);
		objectives.add("Productos fabricados", Sign.MAX, numProd);
		
		return objectives;
	}
}

package electric;

import org.opt4j.core.problem.ProblemModule;

public class ElectricModule extends ProblemModule 
{

	@Override
	protected void config() 
	{
		// mostrar� errores mientras ProyectoCreator, ProyectoDecoder y ProyectoEvaluator no est�n completos
		bindProblem(ElectricCreator.class, ElectricDecoder.class, ElectricEvaluator.class);
	}

}

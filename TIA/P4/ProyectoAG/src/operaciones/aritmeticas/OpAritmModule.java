package operaciones.aritmeticas;

import org.opt4j.core.problem.ProblemModule;

public class OpAritmModule extends ProblemModule{
	protected void config()
	{
		bindProblem(OpAritmCreator.class, OpAritmDecoder.class, OpAritmEvaluator.class);
	}
}

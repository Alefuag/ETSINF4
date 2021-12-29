/*******************************************************************************
 * Copyright (c) 2014 Opt4J
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 *******************************************************************************/
 

package org.opt4j.core.optimizer;

import org.opt4j.core.config.Icons;
import org.opt4j.core.config.annotations.Category;
import org.opt4j.core.config.annotations.Icon;
import org.opt4j.core.start.Opt4JModule;

/**
 * Abstract module class for the {@link Optimizer} modules.
 * 
 * @author lukasiewycz
 * @see Optimizer
 * @see IterativeOptimizer
 * 
 */
@Icon(Icons.OPTIMIZER)
@Category
public abstract class OptimizerModule extends Opt4JModule {

	/**
	 * Binds the given {@link Optimizer}.
	 * 
	 * @param optimizer
	 *            the optimizer to bind
	 */
	protected void bindOptimizer(Class<? extends Optimizer> optimizer) {
		bind(Optimizer.class).to(optimizer).in(SINGLETON);
	}

	/**
	 * Binds the given {@link IterativeOptimizer}.
	 * 
	 * @param optimizer
	 *            the iterative optimizer to bind
	 */
	protected void bindIterativeOptimizer(Class<? extends IterativeOptimizer> optimizer) {
		bind(IterativeOptimizer.class).to(optimizer).in(SINGLETON);
	}

}

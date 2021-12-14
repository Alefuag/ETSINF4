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
 

package org.opt4j.benchmarks.dtlz;

import static java.lang.Math.PI;
import static java.lang.Math.cos;

import java.util.List;

import org.opt4j.benchmarks.M;
import org.opt4j.benchmarks.N;

import com.google.inject.Inject;

/**
 * The {@link DTLZ3} function.
 * 
 * @author lukasiewycz
 * 
 */
public class DTLZ3 extends DTLZ2 {

	/**
	 * Constructs a {@link DTLZ3} function.
	 * 
	 * @param m
	 *            the number of objective functions.
	 * @param n
	 *            the size of the search space (length of the x vector).
	 */
	@Inject
	public DTLZ3(@M int m, @N int n) {
		super(m, n);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.opt4j.benchmark.dtlz.DTLZEvaluator#g(java.util.List)
	 */
	@Override
	protected double g(List<Double> x) {
		double g = 0;
		for (double e : x) {
			double k = (e - 0.5) * (e - 0.5);
			double j = cos(20 * PI * (e - 0.5));
			g += k - j;

		}
		g += x.size();
		g *= 100;

		return g;
	}

}

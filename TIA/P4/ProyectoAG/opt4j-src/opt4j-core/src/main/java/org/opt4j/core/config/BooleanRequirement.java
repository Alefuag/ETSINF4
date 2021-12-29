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
 

package org.opt4j.core.config;

/**
 * The {@link BooleanRequirement} is a {@link Requirement} that depends on a
 * boolean valued {@link Property}.
 * 
 * @author lukasiewycz
 * 
 */
public class BooleanRequirement implements Requirement {

	private final Boolean value;

	private final Property property;

	/**
	 * Constructs a {@link BooleanRequirement}.
	 * 
	 * @param property
	 *            the monitored property
	 * @param value
	 *            the boolean value
	 */
	public BooleanRequirement(Property property, boolean value) {
		this.property = property;
		this.value = value;

		Class<?> type = property.getType();

		if (!type.equals(Boolean.TYPE)) {
			throw new IllegalArgumentException(property + " is not a boolean property.");
		}

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.opt4j.conf.Requirement#getProperty()
	 */
	@Override
	public Property getProperty() {
		return property;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.opt4j.conf.Requirement#isFulfilled()
	 */
	@Override
	public boolean isFulfilled() {
		if (property.isActive()) {
			Object obj = property.getValue();
			return value.equals(obj);
		}
		return false;
	}

}

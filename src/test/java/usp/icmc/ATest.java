package usp.icmc;

import static org.junit.Assert.*;

import org.junit.Test;

public class ATest {

	@Test
	public void testATrue() {
		assertEquals("True",new A().a(true));
	}
	
	@Test
	public void testAFalse() {
		assertEquals("False",new A().a(false));
	}
	
	@Test
	public void testAFalse2() {
		assertEquals("False",new A().a(false));
	}

}

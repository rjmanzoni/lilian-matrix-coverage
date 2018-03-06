package usp.icmc;

import static org.junit.Assert.*;

import org.junit.Test;

public class BTest {

	@Test
	public void testBTrue() {
		assertEquals("True",new B().b(true));
	}
	
	@Test
	public void testBFlase() {
		assertEquals("False",new B().b(false));
	}
	
	@Test
	public void testATrue() {
		assertEquals("True",new A().a(true));
	}
	
	@Test
	public void testAFalse() {
		assertEquals("False",new A().a(false));
	}

}

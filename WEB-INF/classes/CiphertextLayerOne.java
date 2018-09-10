package cpabe;
import java.util.Arrays;
import it.unisa.dia.gas.jpbc.Element;

public class CiphertextLayerOne
{
	public Element _S;
	public Element _A; 
	public Element _B;
	public byte[] _C;
	
	public CiphertextLayerOne(Element S, Element A, Element B, byte[] C)
	{
		this._S = S.duplicate();
		this._A = A.duplicate();
		this._B = B.duplicate();
		this._C = Arrays.copyOf(C, C.length);
	}
}
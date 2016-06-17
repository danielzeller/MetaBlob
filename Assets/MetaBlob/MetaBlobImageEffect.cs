using UnityEngine;

[ExecuteInEditMode]
[RequireComponent (typeof(Camera))]
public class MetaBlobImageEffect : MonoBehaviour
{
	#region Public Properties
	[SerializeField]
	Color _color1 = Color.blue;

	[Range(0f,3f)]
	public float cutoffFactor;

	public Color color1 {
		get { return _color1; }
		set { _color1 = value; }
	}
		
	#endregion
 
	[SerializeField] Shader _shader;
	Material _material;
 
	#region MonoBehaviour Functions

	void OnRenderImage (RenderTexture source, RenderTexture destination)
	{
		if (_material == null) {
			_material = new Material (_shader);
			_material.hideFlags = HideFlags.DontSave;
		}

		_material.SetColor ("_Color1", _color1);
		_material.SetFloat ("_cutoffFactor", cutoffFactor);
		Graphics.Blit (source, destination, _material, 0);
	}

	#endregion
    
}

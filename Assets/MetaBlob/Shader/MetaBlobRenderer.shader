Shader "Hidden/MetaBlobRenderer"
{
    Properties
    {
        _MainTex ("-", 2D) = "black" {}
        _Color1 ("-", Color) = (0, 0, 1, 0) 
    }

    CGINCLUDE

  
    #pragma multi_compile _ _DEBUG
    #include "UnityCG.cginc"

    sampler2D _MainTex;
    half4 _Color1; 

   	float _cutoffFactor;

    half4 frag(v2f_img i) : SV_Target
    {
        half4 src = tex2D(_MainTex, i.uv);
   		if(((abs(src.r-_Color1.r )+abs(src.g-_Color1.g )+abs(src.b-_Color1.b ))<_cutoffFactor) )
      		return _Color1;
        return src;
    }

    ENDCG

    SubShader
    {
        Pass
        {
            ZTest Always Cull Off ZWrite Off
            CGPROGRAM
            #pragma vertex vert_img
            #pragma fragment frag
            ENDCG
        }
    }
}

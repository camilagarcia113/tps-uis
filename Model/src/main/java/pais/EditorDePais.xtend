package pais

import org.uqbar.commons.utils.Observable
import mapamundi.Mapamundi
import java.util.Set
import lugarDeInteres.LugarDeInteres

@Observable
class EditorDePais {
	
	Pais _pais
	
	@Property
	String nombre
	
	@Property
	Set<Pais> conexiones
	
	@Property
	Set<String> caracteristicas
	
	@Property
	Set<LugarDeInteres> lugaresDeInteres
	
	Mapamundi _mapamundi
	
	new(Mapamundi mapamundi, Pais pais){
		this._mapamundi = mapamundi
		this._pais = pais
		_nombre = pais.nombre
		_conexiones = pais.conexiones
		_caracteristicas = pais.caracteristicas
		_lugaresDeInteres = pais.lugaresDeInteres
	}
	
	new(Mapamundi mapamundi) {
		_mapamundi = mapamundi
		_nombre = ""
		_conexiones = newHashSet
		_caracteristicas = newHashSet
		_lugaresDeInteres = newHashSet	
	}
	
	def agregarPais(){
		val paisParaAgregar = new Pais(_nombre, _caracteristicas, _conexiones, _lugaresDeInteres)
		if(_pais == null){
			_pais = paisParaAgregar
			this._mapamundi.agregarPais(this._pais)
		}else{
			_pais.syncWith(paisParaAgregar)
		}
	}
	
	def getPais(){
		this._pais
	}
	
	def getMapamundi(){
		this._mapamundi
	}
	
	def agregarCaracteristica(String caracteristica) {
		_caracteristicas.add(caracteristica)
	}
	
	def borrarCaracteristica(String caracteristica) {
		_caracteristicas.remove(caracteristica)
	}
	
	def borrarLugarDeInteres(LugarDeInteres unLugarDeInteres) {
		_lugaresDeInteres.remove(unLugarDeInteres)
	}
	
	def agregarLugarDeInteres(LugarDeInteres unLugarDeInteres) {
		_lugaresDeInteres.add(unLugarDeInteres)
	}
	
	def borrarConexion(Pais unaConexion) {
		_conexiones.remove(unaConexion)
	}
	
	def agregarConexion(Pais unaConexion) {
		_conexiones.add(unaConexion)
	}
	
}
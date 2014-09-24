package villano

import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Button
import java.awt.Color

class EditarHobbiesDeVillanoWindow extends Dialog<EditorDeHobbiesDeVillano>{
	
	new(WindowOwner owner, EditorDeHobbiesDeVillano model) {
		super(owner, model)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		setWindowTitle()
		mainPanel.setLayout(new VerticalLayout)
		verHobbies(mainPanel)
		eliminarHobbieButton(mainPanel)
		agregarHobbie(mainPanel)
		aceptarButton(mainPanel)
	}
	
	def setWindowTitle() {
		this.setTitle("Editar hobbies")
	}
	
	def verHobbies(Panel mainPanel) {
		mainPanel.setLayout(new VerticalLayout)
		new Label(mainPanel) => [
			setText("Hobbie")
			setBackground(Color::lightGray)
		]
		
		new List(mainPanel) => [
			width = 300
			height = 150
			bindValueToProperty("hobbieSeleccionado")
			bindItemsToProperty("hobbies")
		]	
	}
	
	def eliminarHobbieButton (Panel mainPanel) {
		val eliminarButtonPanel = new Panel(mainPanel)
		eliminarButtonPanel.layout = new HorizontalLayout
		new Button(eliminarButtonPanel) => [
			caption = "Eliminar"
			onClick [ | this.modelObject.borrarHobbie ]
			setBackground(Color::lightGray)
			bindEnabledToProperty("seleccionoHobbieAEliminar")
		]
	}
	
	def agregarHobbie (Panel mainPanel) {
		val agregarPanel = new Panel(mainPanel)
		agregarPanel.layout = new HorizontalLayout
		val hobbie = new TextBox(agregarPanel).width = 230
		hobbie.bindValueToProperty("hobbieNuevo")
		
		new Button(agregarPanel) => [
			caption = "Agregar"
			onClick [ | this.modelObject.agregarHobbie ]
			setBackground(Color::lightGray)
			bindEnabledToProperty("hayHobbieParaAgregar")
		]	
	}
	
	def aceptarButton (Panel mainPanel) {
		val buttonPanel = new Panel(mainPanel)
		buttonPanel.layout = new HorizontalLayout
		new Button(buttonPanel) => [
			caption = "Aceptar"
			onClick [|close]
			setBackground(Color::lightGray)
		]
	}
	
}
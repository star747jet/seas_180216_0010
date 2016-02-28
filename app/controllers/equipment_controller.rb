class EquipmentController < ApplicationController
  helper :headshot
  #before_action :authenticate_user!


  def sample_method
    if params[:keyword] == nil
      @result = 'Please select search type'
    else
      if  Article.find_by_id(params[:keyword])
    		@result = 'Found!'
      else
    		@result =  "#{params[:keyword]} Not found!"
    	end
    end
  end

  def takeashot
  end

  def advance
  end

  def search 
   
  end

  def photo
  end

  def reserved
    @name = current_user.name
  end

  def doReserve
    @name = current_user.name
    @equipment = Equipment.find_by(equip_id: params[:id])
    @equipment.update(equip_status: 'Reserved' )
    @equipment.update(reserved_by: @name)
    @equipment.update(process: 'Pending')
    @equipment.update(req_date: Time.now)
    redirect_to :back
  end

  def decoder
    session[:qr] = puts Qrio::Qr.load("public/qrpic/qr1.png").qr.text

    redirect_to equipment_search_path
  end

  def approve
    @equipment = Equipment.find_by(equip_id: params[:id])
    @equipment.update(process: 'Received')
    redirect_to equipment_audit_path
  end

  def reset
    @equipment = Equipment.all
    @equipment.each do |e|
      e.update(reserved_by: '',department: ' ',process: ' ',updated_at: ' ',req_date: ' ',equip_status: 'Available')
    end
    redirect_to equipment_search_path
  end

  def cancel
    @equipment = Equipment.find_by(equip_id: params[:id])
    @equipment.update(reserved_by: '')
    @equipment.update(equip_status: 'Available')
    @equipment.update(process: '')
    redirect_to equipment_reserved_path
  end

  def saveimage
    @image = params[:image]
    @e = Equipment.find_by(equip_id: "BD7110-631-46110096F")
    @e.update(image: @image)
    redirect_to equipment_info_path(id: "BD7110-631-46110096F")
  end
    
  def showimage
    @e = Equipment.find_by(equip_id: "BD7110-631-46110096F")
    send_data @e.image, :type => 'image/jpg',:disposition => 'inline'
  end

  def upload
    @id = session[:id]
    session[:name] = params[:id]
    name = "#{@id}" + ".jpg" 
    directory = "public/headshots/"
    path = File.join(directory, name)
    File.open(path, "wb") { |f| f.write(params[:upload][:file].read) }
    flash[:notice] = "File uploaded"
    redirect_to equipment_info_path(id: "BD7110-631-46110096F")
  end

  def return
    @equipment = Equipment.find_by(equip_id: params[:id])
    @equipment.update(reserved_by: '')
    @equipment.update(equip_status: 'Available')
    @equipment.update(process: '')
    redirect_to equipment_audit_path
  end
end

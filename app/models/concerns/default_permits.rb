class DefaultPermits
  Courses = {
    tb_main:{
      par_in:'443455434',
      par_out:'453445344',
      tees:'gold Blue White Gray Red Junior other'
      },
    tb_par3:{
      par_in:'333333333',
      par_out:'333333333',
      tees:'Par3'
    }
  }
  
  CRUD = {
    super:{
      group:'1111',
      user:'1111',
      player:'1111',
      game:'1111',
      round:'1111',
      blog:'1111',
      comment:'1111'
    },
    admin:{
      group:'0110',
      user:'1111',
      player:'1111',
      game:'1111',
      round:'1111',
      blog:'1111',
      comment:'1111'
    },
    trustee:{
      group:'0100',
      user:'0000',
      player:'1111',
      game:'1111',
      round:'1111',
      blog:'1111',
      comment:'1111'
    },
    member:{
      group:'0100',
      user:'0000',
      player:'1111',
      game:'1111',
      round:'1111',
      blog:'1111',
      comment:'1111'
    },
    guest:{
      group:'0100',
      user:'0000',
      player:'0100',
      game:'0100',
      round:'0100',
      blog:'0100',
      comment:'0100'
    }
  }

  def crud
    return CRUD
  end

  def roles
      return CRUD.keys.map{|o| o = o.to_s}
    end

  def models
    return CRUD[:super].keys.map{|o| o = o.to_s}
  end
  
end
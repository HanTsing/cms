#encoding: utf-8
class AuthorityCell < Cell::Rails

  def all_role_authorities(args)
    @role = args[:role]
    @authorities = Authority.all
    render
  end
end

module TeamsHelper
  def photo_path(player)
    player.photo || "player.png"
  end
end

# This module makes testing easer.
module SpecUtility

  # Like AbstractController::Translation.t, however, raise if translation is missing.
  def t(*args)
    I18n.translate!(*args)
  end
end
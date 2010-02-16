require 'rubygems'
require 'rave'
require 'open-uri'

module Waference
  class Robot < Rave::Models::Robot
    TROPO_TOKEN = "40d6c26bc2bc18428b96ffac6552845adaf2815e7999bca22b0428d2c4540ed33723ee72967195146e795130"
    CALL_URL = 'http://api.tropo.com/1.0/sessions?action=create&token=' + TROPO_TOKEN

    def blip_submitted(event, context)
      blip = event.blip
      text = blip.content
      call_url = CALL_URL + "&numberToDial=" + text
      call_html = "<a href=\"" + call_url + "\">Click to call</a>"
      @logger.info "+++++++++++++++++++++++++" + call_html
      blip.set_text(call_url)
#      blip.set_text(call_html, :format => "html".to_sym)
#      result = open(call_url).read
    end

    #Define handlers here:
    # e.g. if the robot should act on a DOCUMENT_CHANGED event:
    # 
    # def document_changed(event, context)
    #   #Do some stuff
    # end
    # 
    # Events are: 
    # 
    # WAVELET_BLIP_CREATED, WAVELET_BLIP_REMOVED, WAVELET_PARTICIPANTS_CHANGED,
    # WAVELET_TIMESTAMP_CHANGED, WAVELET_TITLE_CHANGED, WAVELET_VERSION_CHANGED,
    # BLIP_CONTRIBUTORS_CHANGED, BLIP_DELETED, BLIP_SUBMITTED, BLIP_TIMESTAMP_CHANGED,
    # BLIP_VERSION_CHANGED, DOCUMENT_CHANGED, FORM_BUTTON_CLICKED
    #
    # If you want to name your event handler something other than the default name, 
    # or you need to have more than one handler for an event, you can register handlers
    # in the robot's constructor:
    #
    # def initialize(options={})
    #   super
    #   register_handler(Rave::Models::Event::DOCUMENT_CHANGED, :custom_doc_changed_handler)
    # end
    # 
    # def custom_doc_changed_handler(event, context)
    #   #Do some stuff
    # end
    # 
    # Note: Don't forget to call super if you define #initialize
    
  end
end

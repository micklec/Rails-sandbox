# @api private
class Selenium::WebDriver::Remote::Bridge

  #
  # http://code.google.com/p/selenium/wiki/JsonWireProtocol#Command_Reference
  #

  command :newSession,                             :post,    "session"
  command :getCapabilities,                        :get,     "session/:session_id"

  #
  # basic driver
  #

  command :getCurrentUrl,                          :get,     "session/:session_id/url"
  command :get,                                    :post,    "session/:session_id/url"
  command :goForward,                              :post,    "session/:session_id/forward"
  command :goBack,                                 :post,    "session/:session_id/back"
  command :refresh,                                :post,    "session/:session_id/refresh"
  command :quit,                                   :delete,  "session/:session_id"
  command :close,                                  :delete,  "session/:session_id/window"
  command :getVisible,                             :get,     "session/:session_id/visible"
  command :setVisible,                             :post,    "session/:session_id/visible"
  command :getPageSource,                          :get,     "session/:session_id/source"
  command :getTitle,                               :get,     "session/:session_id/title"
  command :findElement,                            :post,    "session/:session_id/element"
  command :findElements,                           :post,    "session/:session_id/elements"
  command :getActiveElement,                       :post,    "session/:session_id/element/active"

  #
  # window handling
  #

  command :getCurrentWindowHandle,                 :get,     "session/:session_id/window_handle"
  command :getWindowHandles,                       :get,     "session/:session_id/window_handles"
  command :setWindowSize,                          :post,    "session/:session_id/window/:window_handle/size"
  command :setWindowPosition,                      :post,    "session/:session_id/window/:window_handle/position"
  command :getWindowSize,                          :get,     "session/:session_id/window/:window_handle/size"
  command :getWindowPosition,                      :get,     "session/:session_id/window/:window_handle/position"

  #
  # script execution
  #

  command :executeScript,                          :post,    "session/:session_id/execute"
  command :executeAsyncScript,                     :post,    "session/:session_id/execute_async"

  #
  # screenshot
  #

  command :screenshot,                             :get,     "session/:session_id/screenshot"

  #
  # alerts
  #

  command :dismissAlert,                           :post,    "session/:session_id/dismiss_alert"
  command :acceptAlert,                            :post,    "session/:session_id/accept_alert"
  command :getAlertText,                           :get,     "session/:session_id/alert_text"
  command :setAlertValue,                          :post,    "session/:session_id/alert_text"

  #
  # target locator
  #

  command :switchToFrame,                          :post,    "session/:session_id/frame"
  command :switchToWindow,                         :post,    "session/:session_id/window"

  #
  # options
  #

  command :getAllCookies,                          :get,     "session/:session_id/cookie"
  command :addCookie,                              :post,    "session/:session_id/cookie"
  command :deleteAllCookies,                       :delete,  "session/:session_id/cookie"
  command :deleteCookieNamed,                      :delete,  "session/:session_id/cookie/:name"

  #
  # timeouts
  #

  command :setImplicitWaitTimeout,                 :post,    "session/:session_id/timeouts/implicit_wait"
  command :setScriptTimeout,                       :post,    "session/:session_id/timeouts/async_script"

  #
  # element
  #

  command :describeElement,                        :get,     "session/:session_id/element/:id"
  command :findChildElement,                       :post,    "session/:session_id/element/:id/element"
  command :findChildElements,                      :post,    "session/:session_id/element/:id/elements"
  command :clickElement,                           :post,    "session/:session_id/element/:id/click"
  command :submitElement,                          :post,    "session/:session_id/element/:id/submit"
  command :getElementValue,                        :get,     "session/:session_id/element/:id/value"
  command :sendKeysToElement,                      :post,    "session/:session_id/element/:id/value"
  command :uploadFile,                             :post,    "session/:session_id/file"
  command :getElementTagName,                      :get,     "session/:session_id/element/:id/name"
  command :clearElement,                           :post,    "session/:session_id/element/:id/clear"
  command :isElementSelected,                      :get,     "session/:session_id/element/:id/selected"
  command :isElementEnabled,                       :get,     "session/:session_id/element/:id/enabled"
  command :getElementAttribute,                    :get,     "session/:session_id/element/:id/attribute/:name"
  command :elementEquals,                          :get,     "session/:session_id/element/:id/equals/:other"
  command :isElementDisplayed,                     :get,     "session/:session_id/element/:id/displayed"
  command :getElementLocation,                     :get,     "session/:session_id/element/:id/location"
  command :getElementLocationOnceScrolledIntoView, :get,     "session/:session_id/element/:id/location_in_view"
  command :getElementSize,                         :get,     "session/:session_id/element/:id/size"
  command :dragElement,                            :post,    "session/:session_id/element/:id/drag"
  command :getElementValueOfCssProperty,           :get,     "session/:session_id/element/:id/css/:property_name"
  command :getElementText,                         :get,     "session/:session_id/element/:id/text"

  #
  # rotatable
  #

  command :getScreenOrientation,                   :get,     "session/:session_id/orientation"
  command :setScreenOrientation,                   :post,    "session/:session_id/orientation"

  #
  # interactions API
  #

  command :click,                                  :post,    "session/:session_id/click"
  command :doubleClick,                            :post,    "session/:session_id/doubleclick"
  command :mouseDown,                              :post,    "session/:session_id/buttondown"
  command :mouseUp,                                :post,    "session/:session_id/buttonup"
  command :mouseMoveTo,                            :post,    "session/:session_id/moveto"
  command :sendModifierKeyToActiveElement,         :post,    "session/:session_id/modifier"
  command :sendKeysToActiveElement,                :post,    "session/:session_id/keys"

  #
  # html 5
  #

  command :executeSql,                             :post,   "session/:session_id/execute_sql"

  command :getLocation,                            :get,    "session/:session_id/location"
  command :setLocation,                            :post,   "session/:session_id/location"

  command :getAppCache,                            :get,    "session/:session_id/application_cache"
  command :getAppCacheStatus,                      :get,    "session/:session_id/application_cache/status"
  command :clearAppCache,                          :delete, "session/:session_id/application_cache/clear"

  command :isBrowserOnline,                        :get,    "session/:session_id/browser_connection"
  command :setBrowserOnline,                       :post,   "session/:session_id/browser_connection"

  command :getLocalStorageItem,                    :get,    "session/:session_id/local_storage/key/:key"
  command :removeLocalStorageItem,                 :delete, "session/:session_id/local_storage/key/:key"
  command :getLocalStorageKeys,                    :get,    "session/:session_id/local_storage"
  command :setLocalStorageItem,                    :post,   "session/:session_id/local_storage"
  command :clearLocalStorage,                      :delete, "session/:session_id/local_storage"
  command :getLocalStorageSize,                    :get,    "session/:session_id/local_storage/size"

  command :getSessionStorageItem,                  :get,    "session/:session_id/session_storage/key/:key"
  command :removeSessionStorageItem,               :delete, "session/:session_id/session_storage/key/:key"
  command :getSessionStorageKeys,                  :get,    "session/:session_id/session_storage"
  command :setSessionStorageItem,                  :post,   "session/:session_id/session_storage"
  command :clearSessionStorage,                    :delete, "session/:session_id/session_storage"
  command :getSessionStorageSize,                  :get,    "session/:session_id/session_storage/size"

  #
  # ime
  #

  command :imeGetAvailableEngines,                 :get,    "session/:session_id/ime/available_engines"
  command :imeGetActiveEngine,                     :get,    "session/:session_id/ime/active_engine"
  command :imeIsActivated,                         :get,    "session/:session_id/ime/activated"
  command :imeDeactivate,                          :post,   "session/:session_id/ime/deactivate"
  command :imeActivateEngine,                      :post,   "session/:session_id/ime/activate"

  #
  # touch
  #

  command :touchSingleTap,                         :post,   "session/:session_id/touch/click"
  command :touchDoubleTap,                         :post,   "session/:session_id/touch/doubleclick"
  command :touchLongPress,                         :post,   "session/:session_id/touch/longclick"
  command :touchDown,                              :post,   "session/:session_id/touch/down"
  command :touchUp,                                :post,   "session/:session_id/touch/up"
  command :touchMove,                              :post,   "session/:session_id/touch/move"
  command :touchScroll,                            :post,   "session/:session_id/touch/scroll"
  command :touchFlick,                             :post,   "session/:session_id/touch/flick"
end

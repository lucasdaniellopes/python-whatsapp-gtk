#!/usr/bin/env python3

import gi
import os

gi.require_version("Gtk", "3.0")
gi.require_version("WebKit2", "4.1")
from gi.repository import Gtk, WebKit2

class ClientWindow(Gtk.Window):
    def __init__(self):
        super().__init__(title="WhatsApp")
        self.set_default_size(1000, 700)
        
        base_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), "wtp_data")

        data_manager = WebKit2.WebsiteDataManager(
            base_data_directory = base_path,
            base_cache_directory = base_path
        )

        context = WebKit2.WebContext.new_with_website_data_manager(data_manager)

        self.webview = WebKit2.WebView.new_with_context(context)
        self.webview.load_uri("https://web.whatsapp.com/")
        self.add(self.webview)

if __name__ == "__main__":
    app = ClientWindow()
    app.connect("destroy", Gtk.main_quit)
    app.show_all()
    Gtk.main()

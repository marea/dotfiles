import xrp
startpage = 'file:///home/marea/.browser/index.html'

xr = xrp.parse_file('/home/marea/.xcolors/sayo-dark', None).definitions
config.load_autoconfig(True)
c.auto_save.session = True

c.colors.completion.category.bg = xr['clr00']
c.colors.completion.category.border.bottom = xr['clr00']
c.colors.completion.category.border.top = xr['clr00']
c.colors.completion.category.fg = xr['clr02']
c.colors.completion.even.bg = xr['clr00']
c.colors.completion.fg = [xr['clr07'], xr['clr03'], xr['clr02']]
c.colors.completion.item.selected.bg = xr['clr02']
c.colors.completion.item.selected.border.bottom = xr['clr02']
c.colors.completion.item.selected.border.top = xr['clr02']
c.colors.completion.item.selected.fg = xr['clr00']
c.colors.completion.item.selected.match.fg = xr['clr08']
c.colors.completion.match.fg = xr['clr05']
c.colors.completion.odd.bg = xr['clr00']
c.colors.completion.scrollbar.bg = xr['clr00']
c.colors.completion.scrollbar.fg = xr['clr15']

c.colors.contextmenu.disabled.bg = xr['clr00']
c.colors.contextmenu.disabled.fg = xr['clr03']
c.colors.contextmenu.menu.bg = xr['clr00']
c.colors.contextmenu.menu.fg = xr['clr07']
c.colors.contextmenu.selected.bg = xr['clr02']
c.colors.contextmenu.selected.fg = xr['clr00']

c.colors.downloads.bar.bg = xr['clr00']
c.colors.downloads.error.bg = xr['clr04']
c.colors.downloads.error.fg = xr['clr00']
c.colors.downloads.start.bg = xr['clr01']
c.colors.downloads.start.fg = xr['clr00']
c.colors.downloads.stop.bg = xr['clr00']
c.colors.downloads.stop.fg = xr['clr15']

c.colors.hints.bg = xr['clr02']
c.colors.hints.fg = xr['clr00']
c.colors.hints.match.fg = xr['clr07']

c.colors.keyhint.bg = xr['clr00']
c.colors.keyhint.fg = xr['clr07']
c.colors.keyhint.suffix.fg = xr['clr02']

c.colors.messages.error.bg = xr['clr05']
c.colors.messages.error.border = xr['clr05']
c.colors.messages.error.fg = xr['clr00']

c.colors.messages.info.bg = xr['clr00']
c.colors.messages.info.border = xr['clr00']
c.colors.messages.info.fg = xr['clr07']

c.colors.messages.warning.bg = xr['clr02']
c.colors.messages.warning.border = xr['clr02']
c.colors.messages.warning.fg = xr['clr00']

c.colors.prompts.bg = xr['clr00']
c.colors.prompts.border = '1px solid ' + xr['clr08']
c.colors.prompts.fg = xr['clr15']
c.colors.prompts.selected.bg = xr['clr02']

c.colors.statusbar.caret.bg = xr['clr06']
c.colors.statusbar.caret.fg = xr['clr00']

c.colors.statusbar.caret.selection.bg = xr['clr05']
c.colors.statusbar.caret.selection.fg = xr['clr00']

c.colors.statusbar.command.bg = xr['clr00']
c.colors.statusbar.command.fg = xr['clr07']

c.colors.statusbar.command.private.bg = xr['clr05']
c.colors.statusbar.command.private.fg = xr['clr00']

c.colors.statusbar.insert.bg = xr['clr03']
c.colors.statusbar.insert.fg = xr['clr00']

c.colors.statusbar.normal.bg = xr['clr00']
c.colors.statusbar.normal.fg = xr['clr07']

c.colors.statusbar.passthrough.bg = xr['clr01']
c.colors.statusbar.passthrough.fg = xr['clr00']

c.colors.statusbar.private.bg = xr['clr05']
c.colors.statusbar.private.fg = xr['clr00']

c.colors.statusbar.progress.bg = xr['clr15']

c.colors.statusbar.url.error.fg = xr['clr04']

c.colors.statusbar.url.fg = xr['clr07']

c.colors.statusbar.url.hover.fg = xr['clr01']

c.colors.statusbar.url.success.http.fg = xr['clr07']
c.colors.statusbar.url.success.https.fg = xr['clr03']

c.colors.statusbar.url.warn.fg = xr['clr04']

c.colors.tabs.bar.bg = xr['clr00']

c.colors.tabs.even.bg = xr['clr00']
c.colors.tabs.even.fg = xr['clr07']

c.colors.tabs.indicator.error = xr['clr04']
c.colors.tabs.indicator.start = xr['clr07']
c.colors.tabs.indicator.stop = xr['clr00']

c.colors.tabs.odd.bg = xr['clr00']
c.colors.tabs.odd.fg = xr['clr07']

c.colors.tabs.pinned.even.bg = xr['clr00']
c.colors.tabs.pinned.even.fg = xr['clr03']

c.colors.tabs.pinned.odd.bg = xr['clr00']
c.colors.tabs.pinned.odd.fg = xr['clr03']

c.colors.tabs.pinned.selected.even.bg = xr['clr02']
c.colors.tabs.pinned.selected.even.fg = xr['clr00']

c.colors.tabs.pinned.selected.odd.bg = xr['clr02']
c.colors.tabs.pinned.selected.odd.fg = xr['clr00']

c.colors.tabs.selected.even.bg = xr['clr02']
c.colors.tabs.selected.even.fg = xr['clr00']

c.colors.tabs.selected.odd.bg = xr['clr02']
c.colors.tabs.selected.odd.fg = xr['clr00']

c.completion.height = '20%'
c.completion.shrink = True
c.confirm_quit = ['downloads']

c.content.blocking.enabled = True
c.content.blocking.method = 'auto'

c.downloads.location.prompt = False
c.downloads.position = 'bottom'
c.downloads.remove_finished = 1000

c.hints.auto_follow = 'full-match'
c.hints.border = '1px solid ' + xr['clr00']
c.hints.mode = 'word'

c.input.insert_mode.auto_load = True

c.session.lazy_restore = True

c.spellcheck.languages = ['es-ES', 'en-US']

c.statusbar.position = 'bottom'

c.tabs.last_close = 'startpage'
c.tabs.mousewheel_switching = False
c.tabs.show = 'multiple'
c.tabs.title.alignment = 'center'
c.tabs.title.format = '{audio}{current_title}'
c.tabs.title.format_pinned = ''

c.url.default_page = startpage
c.url.open_base_url = True

c.url.searchengines = {'DEFAULT': 'https://duckduckgo.com/?q={}', 'r':
        'https://old.reddit.com/r/{}'}

c.url.start_pages = [startpage]

c.window.title_format = '{perc}{current_title}'

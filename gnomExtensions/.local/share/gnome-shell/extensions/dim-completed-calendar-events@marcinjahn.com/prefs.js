import { ExtensionPreferences } from 'resource:///org/gnome/Shell/Extensions/js/extensions/prefs.js';
import Adw from 'gi://Adw';
import Gtk from 'gi://Gtk';

const SettingsPath = "org.gnome.shell.extensions.dim-completed-calendar-events";
const StylePastDaysSetting = "style-past-days";
const StyleOngoingEventsSetting = "style-ongoing-events";
const HidePastEventsSetting = "hide-past-events";
const HidePastEventsGracePeriodSetting = "hide-past-events-grace-period";

class SettingsManager {
    constructor(settings) {
        this.settings = settings;
    }

    getShouldStylePastDays() {
        return this.settings.get_boolean(StylePastDaysSetting);
    }

    getShouldStyleOngoingEvents() {
        return this.settings.get_boolean(StyleOngoingEventsSetting);
    }

    getShouldHidePastEvents() {
        return this.settings.get_boolean(HidePastEventsSetting);
    }

    getHidePastEventsGracePeriod() {
        return this.settings.get_int(HidePastEventsGracePeriodSetting);
    }

    setShouldStylePastDays(value) {
        this.settings.set_boolean(StylePastDaysSetting, value);
    }

    setShouldStyleOngoingEvents(value) {
        this.settings.set_boolean(StyleOngoingEventsSetting, value);
    }

    setShouldHidePastEvents(value) {
        this.settings.set_boolean(HidePastEventsSetting, value);
    }

    setHidePastEventsGracePeriod(value) {
        this.settings.set_int(HidePastEventsGracePeriodSetting, value);
    }

    connectToChanges(func) {
        return this.settings.connect("changed", func);
    }

    disconnect(subscriptionId) {
        this.settings.disconnect(subscriptionId);
    }
}

class Preferences extends ExtensionPreferences {
    fillPreferencesWindow(window) {
        const page = new Adw.PreferencesPage();
        window.add(page);
        let settings = new SettingsManager(this.getSettings(SettingsPath));
        this.setupPastEventsSettings(page, settings);
        this.setupOngoingEventsSettings(page, settings);
    }

    setupPastEventsSettings(page, settings) {
        const group = new Adw.PreferencesGroup({
            title: "Past Events",
            description: "Settings related to events that are over",
        });
        const rowPastDaySetting = new Adw.ActionRow({
            title: "Style events in past days as well",
            subtitle: "When viewing past days in the panel, the events will be greyed out or hidden",
        });
        const toggleStylePastDays = new Gtk.Switch({
            active: settings.getShouldStylePastDays(),
            valign: Gtk.Align.CENTER,
        });
        toggleStylePastDays.connect("state-set", (_, state) => {
            settings.setShouldStylePastDays(state);

            return false;
        });
        rowPastDaySetting.add_suffix(toggleStylePastDays);
        rowPastDaySetting.activatable_widget = toggleStylePastDays;
        const rowHidePastEventsSetting = new Adw.ActionRow({
            title: "Hide past events completely",
            subtitle: "Useful to see only upcoming events in the panel",
        });
        const toggleHidePastEvents = new Gtk.Switch({
            active: settings.getShouldHidePastEvents(),
            valign: Gtk.Align.CENTER,
        });
        toggleHidePastEvents.connect("state-set", (_, state) => {
            settings.setShouldHidePastEvents(state);
            rowHidePastEventsGracePeriodSetting.set_sensitive(state);
        });
        rowHidePastEventsSetting.add_suffix(toggleHidePastEvents);
        rowHidePastEventsSetting.activatable_widget = toggleHidePastEvents;
        const rowHidePastEventsGracePeriodSetting = new Adw.ActionRow({
            title: "Delay hiding past events (minutes)",
            subtitle: "Useful to see events that are running late",
        });
        const gracePeriodAdjustment = new Gtk.Adjustment({
            lower: 0,
            upper: 60,
            step_increment: 1,
            page_increment: 10,
            value: settings.getHidePastEventsGracePeriod(),
        });
        const inputHidePastEventsGracePeriod = new Gtk.SpinButton({
            adjustment: gracePeriodAdjustment,
            valign: Gtk.Align.CENTER,
        });
        inputHidePastEventsGracePeriod.connect("value-changed", (self) => {
            settings.setHidePastEventsGracePeriod(self.get_value());
        });
        rowHidePastEventsGracePeriodSetting.add_suffix(inputHidePastEventsGracePeriod);
        rowHidePastEventsGracePeriodSetting.activatable_widget =
            inputHidePastEventsGracePeriod;
        group.add(rowPastDaySetting);
        group.add(rowHidePastEventsSetting);
        group.add(rowHidePastEventsGracePeriodSetting);
        page.add(group);
    }

    setupOngoingEventsSettings(page, settings) {
        const group = new Adw.PreferencesGroup({
            title: "Ongoing Events",
            description: "Settings related to events that are ongoing",
        });
        const row = new Adw.ActionRow({
            title: "Highlight ongoing events",
            subtitle: "Will color events that are ongoing with system accent color",
        });
        const toggle = new Gtk.Switch({
            active: settings.getShouldStylePastDays(),
            valign: Gtk.Align.CENTER,
        });
        toggle.connect("state-set", (_, state) => {
            settings.setShouldStyleOngoingEvents(state);

            return false;
        });
        row.add_suffix(toggle);
        row.activatable_widget = toggle;
        group.add(row);
        page.add(group);
    }
}

export { Preferences as default };

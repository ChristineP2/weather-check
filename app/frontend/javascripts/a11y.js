import Cookies from "js-cookie";
let A11yOffCanvasLastScroll;
let cookie_path = { cookiePath: "a11y_cookie" };
let fonts = {
  ".a11y-link-default": "font-family-default",
  ".a11y-font-inter": "font-family-inter",
  ".a11y-font-andika": "font-family-andika",
  ".a11y-font-tiresias": "font-family-tiresias",
  ".a11y-font-opendyslexic": "font-family-opendyslexic",
};

function setFont(fnt) {
  Cookies.set("font-family", fonts["." + fnt], {
    expires: 7,
    path: cookie_path.cookiePath,
  });
  jQuery("body")
    .removeClass(Object.values(fonts).join(" "))
    .addClass(fonts["." + fnt]);
}

function stickyResize() {
  let container = jQuery("#main-header");
  if (
    jQuery("body").hasClass("sticky-bar") &&
    !container.hasClass("top-bar-over-header")
  ) {
    let bar = jQuery("#main-nav");
    if (bar.length) {
      container.css("padding-top", bar.outerHeight() + "px");
    }
  }
}

function scrollToSection(event) {
  event.preventDefault();
  let $section = $($(this).attr("href"));
  $(this)
    .closest("li")
    .addClass("current-menu-item")
    .siblings()
    .removeClass("current-menu-item");
  $("html, body").animate({ scrollTop: $section.offset().top }, 500);
}

function count(options) {
  let $this = $(this);
  options = $.extend({}, options || {}, $this.data("countToOptions") || {});
  $this.countTo(options);
}

function scrolledBar() {
  $("body").toggleClass("scrolled", $(window).scrollTop() >= 5);
}

function A11yOffCanvasToggleNav() {
  let body = $("body");
  if (body.hasClass("off-canvas-opened")) {
    body.removeClass("off-canvas-opened");
    $("#a11y-OffCanvas, #a11y-canvas").find("a").attr("tabindex", -1);
    setTimeout(function () {
      body.removeClass("overflow");
      body.scrollTop(A11yOffCanvasLastScroll);
    }, 300);
  } else {
    A11yOffCanvasLastScroll = $(window).scrollTop();
    body.addClass("off-canvas-opened overflow");
    $("#a11y-OffCanvas, #a11y-canvas").find("a").attr("tabindex", 0);
  }
}

function expand() {
  let expandHeight = 0;
  let widget = jQuery(".a11y-widget.a11y-expand");
  if (widget.length) {
    let child = widget.children().first();
    let container = widget.closest(".a11y-container");
    let container_wrapper = container.parent();
    container_wrapper.addClass("expand");
    expandHeight = container.height();
    child.css("min-height", expandHeight);
  }
}

function formatter(value, settings) {
  return value.toFixed(settings.decimals);
}

function onComplete(value) {
  return value;
}

jQuery(document).ready(function () {
  let ReadableFontButton = jQuery(".a11y-font-readable");
  let font_normal = jQuery(".a11y-font-normal");
  let font_larger = jQuery(".a11y-font-larger");
  let font_smaller = jQuery(".a11y-font-smaller");
  let link_underline = jQuery(".a11y-link-underline");
  let open_acces = jQuery("#a11y-settings-close");
  let reset_all = jQuery(".a11y-reset");
  let body = jQuery("body");
  body.toggleClass("font-readable", Cookies.get("readablefont") === "yes");
  body.toggleClass("link-underline", Cookies.get("underline") === "yes");
  let fsCount = 100;
  let cookieFont = Cookies.get("a11y-font-size");
  if (cookieFont) {
    fsCount = parseInt(cookieFont);
    if (!body.hasClass("fsize" + fsCount)) {
      body.addClass("fsize" + fsCount);
    }
  } else {
    body.removeClass(
      "fsize70 fsize80 fsize90 fsize100 fsize110 fsize120 fsize130"
    );
  }
  font_larger.click(function (event) {
    event.preventDefault();
    if (fsCount < 130) {
      body.removeClass("fsize" + fsCount);
      fsCount = fsCount + 10;
      body.addClass("fsize" + fsCount);
      Cookies.set("a11y-font-size", fsCount, {
        expires: 7,
        path: cookie_path.cookiePath,
      });
    }
  });
  font_smaller.click(function (event) {
    event.preventDefault();
    if (fsCount > 70) {
      body.removeClass("fsize" + fsCount);
      fsCount = fsCount - 10;
      body.addClass("fsize" + fsCount);
      Cookies.set("a11y-font-size", fsCount, {
        expires: 7,
        path: cookie_path.cookiePath,
      });
    }
  });
  font_normal.click(function (event) {
    event.preventDefault();
    fsCount = 100;
    body.removeClass(
      "fsize70 fsize80 fsize90 fsize100 fsize110 fsize120 fsize130 font-readable link-underline"
    );
    Cookies.remove("a11y-font-size", { path: cookie_path.cookiePath });
    Cookies.remove("readablefont", { path: cookie_path.cookiePath });
    Cookies.remove("underline", { path: cookie_path.cookiePath });
  });
  ReadableFontButton.click(function (event) {
    event.preventDefault();
    Cookies.set("readablefont", "yes", {
      expires: 7,
      path: cookie_path.cookiePath,
    });
    if (!body.hasClass("font-readable")) {
      body.addClass("font-readable");
    }
    jQuery(window).trigger("resize");
  });
  link_underline.click(function (event) {
    event.preventDefault();
    Cookies.set("underline", "yes", {
      expires: 7,
      path: cookie_path.cookiePath,
    });
    if (!body.hasClass("link-underline")) {
      body.addClass("link-underline");
    }
  });
  reset_all.click(function () {
    body.removeClass(
      "fsize70 fsize80 fsize90 fsize100 fsize110 fsize120 fsize130 font-readable link-underline.font-family-inter font-family-andika font-family-tiresias font-family-opendyslexic"
    );
    fsCount = 100;
    Cookies.remove("a11y-font-size", { path: cookie_path.cookiePath });
    Cookies.remove("readablefont", { path: cookie_path.cookiePath });
    Cookies.remove("underline", { path: cookie_path.cookiePath });
    Cookies.remove("font-family", { path: cookie_path.cookiePath });
  });
  jQuery(Object.keys(fonts).join(",") + "").click(function (event) {
    event.preventDefault();
    setFont(this.className);
  });
  body.addClass(Cookies.get("font-family"));
  open_acces.click(function () {
    jQuery("body").toggleClass("opened-settings");
    setTimeout(function () {
      stickyResize();
    }, 200);
  });
  open_acces.keypress(function (event) {
    if (event.keyCode == 13) {
      jQuery("body").toggleClass("opened-settings");
      setTimeout(function () {
        stickyResize();
      }, 200);
    }
  });
  jQuery("#main-content #a11y-a11y-mobile a").click(function () {
    jQuery(
      "#main-content .a11y-settings li:first-child ul li:nth-child(2) button"
    ).focus();
  });
  jQuery("#a11y-bar-left #a11y-logo a").focus(function () {
    if (jQuery(this).hasClass("logo-focused")) {
      jQuery(
        "#a11y-OffCanvas-button .toggle-nav, #a11y-canvas-button .a11y-toggle-nav"
      ).focus();
    }
    jQuery(this).addClass("logo-focused");
  });
  if (jQuery(window).width() > 991) {
    jQuery(
      "#main-content #a11y-a11y-mobile a, #main-content .toggle-nav, #a11y-OffCanvas .toggle-nav.close, #a11y-OffCanvas .a11y-search-box input.s, #a11y-OffCanvas .a11y-search-box .button"
    ).attr("tabindex", "-1");
  }

  let mySidenav = $("#mySidenav");
  $(".openNav").click(function () {
    mySidenav.css("width", mySidenav.width() > 1 ? "0" : "300px");
    mySidenav.css("display", "block");
  });
  $(".openNav").keypress(function (event) {
    if (event.keyCode == 13) {
      mySidenav.css("width", mySidenav.width() > 1 ? "0" : "300px");
      mySidenav.css("display", "block");
    }
  });
  $(".closebtn").click(function () {
    mySidenav.css("width", "0");
    mySidenav.css("display", "none");
  });
  $(".closebtn").keypress(function (event) {
    if (event.keyCode == 13) {
      mySidenav.css("width", "0");
      mySidenav.css("display", "none");
    }
  });
  $("[data-scroll]").on("click", scrollToSection);
  $(".count-number").data("countToOptions", {
    formatter: function (value, options) {
      return value
        .toFixed(options.decimals)
        .replace(/\B(?=(?:\d{3})+(?!\d))/g, ",");
    },
  });
  $(".timer").each(count);
  scrolledBar();
  expand();
  $(".a11y-section-space")
    .closest(".a11y-container")
    .parent()
    .addClass("nospace");
  $(".a11y-section-space-top")
    .closest(".a11y-container")
    .parent()
    .addClass("nospace-top");
  $(".a11y-section-space-bottom")
    .closest(".a11y-container")
    .parent()
    .addClass("nospace-bottom");
  let A11yboxWidget = $(".row .a11y-widget");
  A11yboxWidget.first().addClass("first");
  A11yboxWidget.last().addClass("last");
  let A11ybackTop = $("#a11y-back-top");
  A11ybackTop.hide();
  $(window).scroll(function () {
    if ($(this).scrollTop() > 100) {
      A11ybackTop.fadeIn();
    } else {
      A11ybackTop.fadeOut();
    }
  });
  A11ybackTop.find("a").click(function () {
    $("body,html").animate({ scrollTop: 0 }, 800);
    return false;
  });
  A11ybackTop.find("a").keypress(function (event) {
    if (event.keyCode == 13) {
      $("body,html").animate({ scrollTop: 0 }, 800);
      return false;
    }
  });
  $(document).on("click", function () {
    if ($("body").hasClass("off-canvas-opened")) {
      A11yOffCanvasToggleNav();
    }
  });
  let a11yOffcanvas = $("#a11y-OffCanvas");
  a11yOffcanvas.find("a").attr("tabindex", -1);
  $("#a11y-OffCanvas-button, .toggle-nav .open").click(function (e) {
    e.stopPropagation();
    e.preventDefault();
    $(this).toggleClass("active");
    a11yOffcanvas.css("right", "0");
    A11yOffCanvasToggleNav();
  });
  $(".toggle-nav-close").click(function (_e) {
    a11yOffcanvas.css("right", "-330px");
  });
  a11yOffcanvas.click(function (e) {
    e.stopPropagation();
  });
  $("#a11y-canvas").click(function (e) {
    e.stopPropagation();
  });
  $(window).scroll(function () {
    scrolledBar();
  });
});
(function ($) {
  "use strict";
  $.fn.countTo = function (options) {
    options = options || {};
    return $(this).each(function () {
      let settings = $.extend(
        {},
        $.fn.countTo.defaults,
        {
          from: $(this).data("from"),
          to: $(this).data("to"),
          speed: $(this).data("speed"),
          refreshInterval: $(this).data("refresh-interval"),
          decimals: $(this).data("decimals"),
        },
        options
      );
      let loops = Math.ceil(settings.speed / settings.refreshInterval),
        increment = (settings.to - settings.from) / loops;
      let self = this,
        $self = $(this),
        loopCount = 0,
        value = settings.from,
        data = $self.data("countTo") || {};
      $self.data("countTo", data);
      if (data.interval) {
        clearInterval(data.interval);
      }
      data.interval = setInterval(updateTimer, settings.refreshInterval);
      render(value);

      function updateTimer() {
        value += increment;
        loopCount++;
        render(value);
        if (typeof settings.onUpdate == "function") {
          settings.onUpdate.call(self, value);
        }
        if (loopCount >= loops) {
          $self.removeData("countTo");
          clearInterval(data.interval);
          value = settings.to;
          if (typeof settings.onComplete == "function") {
            settings.onComplete.call(self, value);
          }
        }
      }

      function render(value) {
        let formattedValue = settings.formatter.call(self, value, settings);
        $self.html(formattedValue + "+");
      }
    });
  };
  $.fn.countTo.defaults = {
    from: 0,
    to: 0,
    speed: 1000,
    refreshInterval: 100,
    decimals: 0,
    formatter: formatter,
    onUpdate: null,
    onComplete: onComplete,
  };
})(jQuery);

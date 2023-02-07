let tabs = document.querySelectorAll(".tabs li");
let tabsContent = document.querySelectorAll(".tab-content");

let deactivateAllTabs = function () {
  tabs.forEach(function (tab) {
    tab.classList.remove("is-active");
  });
};

let hideTabsContent = function () {
  tabsContent.forEach(function (tabContent) {
    tabContent.classList.remove("is-active");
    tabContent.classList.add("is-hidden");
  });
};

let activateTabsContent = function (tab) {
  tabsContent[getIndex(tab)].classList.add("is-active");
  tabsContent[getIndex(tab)].classList.remove("is-hidden");
};

let getIndex = function (el) {
  return [...el.parentElement.children].indexOf(el);
};

tabs.forEach(function (tab) {
  tab.addEventListener("click", function () {
    deactivateAllTabs();
    hideTabsContent();
    tab.classList.add("is-active");
    activateTabsContent(tab);
  });
});

document.addEventListener("DOMContentLoaded", function () {
  deactivateAllTabs();
  hideTabsContent();
  const start = document.getElementById("present-tab");
  start.classList.add("is-active");
  activateTabsContent(start);
});

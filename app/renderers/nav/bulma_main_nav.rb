# frozen_string_literal: true

# https://bulma.io/documentation/components/navbar/#dropdown-menu

module Nav
  # Navigation Renderer for the topbar navigation
  class BulmaMainNav < SimpleNavigation::Renderer::Base
    def render(item_container)
      if skip_if_empty? && item_container.empty?
        ''
      else
        menu_items(item_container)
      end
    end

    private

    def menu_items(item_container)
      item_container.items.map do |item|
        if include_sub_navigation?(item)
          item_with_subnavigation(item)
        else
          link_to(item.name, item.url, { class: 'navbar-item' })
        end
      end.join
    end

    def item_with_subnavigation(item)
      content_tag(:div,
                  subnav_content(item),
                  { class: 'navbar-item has-dropdown is-hoverable' })
    end

    def subnav_content(item)
      subnav_content = [link_to(item.name, item.url,
                                { class: 'navbar-link' })]
      subnav_content << content_tag(:div,
                                    render_sub_navigation_for(item),
                                    { class: 'navbar-dropdown' })
      subnav_content.join
    end
  end
end

# frozen_string_literal: true

# https://bulma.io/documentation/components/breadcrumb/
# https://www.w3.org/WAI/ARIA/apg/example-index/breadcrumb/index.html

module Nav
  # Navigation Renderer for the Breadcrumbs
  class BulmaBreadcrumbs < SimpleNavigation::Renderer::Breadcrumbs
    def render(item_container)
      content = a_tags(item_container).join(join_with)
      content_tag(:ul,
                  prefix_for(content) + content,
                  item_container.dom_attributes)
    end

    protected

    def a_tags(item_container)
      item_container.items.each_with_object([]) do |item, list|
        next unless item.selected?

        list << content_tag(:li, tag_for(item))

        if include_sub_navigation?(item)
          list.concat(a_tags(item.sub_navigation))
        end
      end
    end
  end
end

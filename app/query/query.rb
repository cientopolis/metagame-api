class Query
  attr_reader :query, :params, :order
  attr_writer :query

  def self.base_query(q)
    @base_query = q
  end

  def self.get_base_query
    @base_query
  end

  def self.result(params, order = nil)
    new.result(params, order)
  end

  def initialize(query = nil)
    @query = query || self.class.get_base_query
    @params = {}
    @order = nil
    fail ArgumentError, 'Must provide a base_query or set a query on your Query your class' unless @query
  end

  def add_filters(params)
    params.each do |field, value|
      if value.present?
        filter_method = "add_#{field}_filter"
        if respond_to?(filter_method, true)
          self.query = send(filter_method, value)
        else
          fail ArgumentError, "Unknown filter attribute #{field}."
        end
      end
    end
  end

  def add_order(order)
    self.query = query.order(order)
  end

  def result(params, order = nil)
    add_filters(params) if params
    add_order(order) if order
    query
  end
end

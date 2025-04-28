class OmnicalcController < ApplicationController

  def square_new
    render({ :template => "omnicalc_templates/square_new"})
  end

  def square_root_new
    render({ :template => "omnicalc_templates/square_root_new"})
  end

  def payment_new
    render({ :template => "omnicalc_templates/payment_new"})
  end

  def random_new
    render({ :template => "omnicalc_templates/random_new"})
  end

  def square_results
    @the_num = params.fetch("user_number").to_f
    @the_results = @the_num ** 2
    render({ :template => "omnicalc_templates/square_results"})
  end

  def square_root_results
    @the_num = params.fetch("user_number").to_f
    @the_results = @the_num ** 0.5
    render({ :template => "omnicalc_templates/square_root_results"})
  end

  def payment_results
    @apr = params.fetch("user_apr").to_f
    @apr_calc = @apr / 100 / 12
    @years = params.fetch("user_years").to_f
    @years_calc = @years * 12
    @principal = params.fetch("user_principal").to_f
    @the_results = (@apr_calc * @principal )/(1 - (1 + @apr_calc)**(- @years_calc))
    render({ :template => "omnicalc_templates/payment_results"})
  end

  def random_results
    @min_num = params.fetch("user_min").to_f
    @max_num = params.fetch("user_max").to_f
    @the_results = rand(@min_num..@max_num)
    render({ :template => "omnicalc_templates/random_results"})
  end
end

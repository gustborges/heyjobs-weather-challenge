class WeatherController < ApplicationController
  before_action :set_default_locale

  def temperature
    degrees = params[:degrees]

    if degrees
      message = degrees && degrees >= 0 ? "above_zero" : "below_zero"

      render json: { description: I18n.t("temperature.#{message}", degrees: degrees.to_s.tr("-", "")) }, status: :ok
    else
      render json: { description: "Error" }, status: :unprocessable_entity
    end
  end

  def wind
    wind_speed = params[:wind_speed]

    if wind_speed
      message = if wind_speed < 3
          "none"
        elsif wind_speed < 8
          "weak"
        elsif wind_speed < 20
          "medium"
        else
          "strong"
        end

      render json: { description: I18n.t("wind.#{message}", wind_speed: wind_speed) }, status: :ok
    else
      render json: { description: "Error" }, status: :unprocessable_entity
    end
  end

  def clouds
    clouds = params[:clouds]

    if clouds
      message = if clouds <= 10
          "none"
        elsif clouds <= 70
          "partial"
        else
          "full"
        end

      render json: { description: I18n.t("clouds.#{message}", clouds: clouds) }, status: :ok
    else
      render json: { description: "Error" }, status: :unprocessable_entity
    end
  end
end

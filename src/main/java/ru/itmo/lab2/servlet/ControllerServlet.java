package ru.itmo.lab2.servlet;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Arrays;

@WebServlet(name = "controllerServlet", value = "/controller")
public class ControllerServlet extends HttpServlet {
    double[] rArray = {1, 1.5, 2, 2.5, 3};
    public void doGet(final HttpServletRequest request, final HttpServletResponse response) throws IOException {
        String forwardPath = getServletContext().getContextPath();
        // Валидация точки
        String x = request.getParameter("x-select");
        String y = request.getParameter("y-select");
        String r = request.getParameter("r-select");
        if (x != null && y != null && r != null
                && validateCoordinates(Double.parseDouble(x), Double.parseDouble(y),Double.parseDouble(r)))
        {
            forwardPath = this.getServletContext().getContextPath() + "/area-check?x-select=" + request.getParameter("x-select")
            + "&y-select=" + request.getParameter("y-select") + "&r-select=" + request.getParameter("r-select");
        }

        response.sendRedirect(forwardPath);
    }

    private boolean validateCoordinates(double x, double y, double r){
        boolean validX = -5 <= x && x <= 5;
        boolean validY = -4 <= y && y <= 4;
        boolean validR = false;
        for (int i = 0; i < rArray.length; i++){
            if (rArray[i] == r){
                validR = true;
                break;
            }
        }
        return validX && validY && validR;
    }
}

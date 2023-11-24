import datetime
import json
import os
import threading
import tkinter
import time

import pandas as pd
import requests
from matplotlib import animation, pyplot as plt
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
from matplotlib.figure import Figure

SMALL_SIZE = 8
MEDIUM_SIZE = 10
BIGGER_SIZE = 12

plt.rc('font', size=SMALL_SIZE)  # controls default text sizes
plt.rc('axes', titlesize=SMALL_SIZE)  # fontsize of the axes title
plt.rc('axes', labelsize=SMALL_SIZE)  # fontsize of the x and y labels
plt.rc('xtick', labelsize=SMALL_SIZE)  # fontsize of the tick labels
plt.rc('ytick', labelsize=SMALL_SIZE)  # fontsize of the tick labels
plt.rc('legend', fontsize=SMALL_SIZE)  # legend fontsize
plt.rc('figure', titlesize=BIGGER_SIZE)  # fontsize of the figure title
fig_color = '#%02x%02x%02x' % (240, 240, 237)


class App:
    def __init__(self):
        self.pressure_points = []
        self.temperature_points = []
        self.timestamps = []
        self.reading = False
        self.save_data = tkinter.IntVar(value=False)

    # 40 ms to get data
    def read_sensor_thread(self):
        self.pressure_points = []
        self.temperature_points = []
        self.humidity_points = []
        self.timestamps = []
        while self.reading:
            self.get_data()
        if self.save_data.get():
            data_output_path = os.path.join(os.getcwd(), 'pressure_data', 'reading_' + str(len(os.listdir(output_path))) + '.csv')
            data_df = pd.DataFrame([self.pressure_points, self.temperature_points, self.timestamps],
                                   index=['Pressure', 'Temperature', 'Timestamp']).transpose()
            data_df.to_csv(data_output_path)

    def plot_data(self, arg):
        plot1.clear()
        plot1.set_title("Pressure Measurements")
        plot1.set_xlabel("Sample")
        plot1.set_ylabel("Pressure (hPa)", color='red')
        plot1.tick_params(axis='y', labelcolor='red')
        plot1.plot(self.pressure_points[-1000:], color='red')

        ax2.clear()
        ax2.set_ylabel("Temperature (C)", color='blue')
        ax2.tick_params(axis='y', labelcolor='blue')
        ax2.plot(self.temperature_points[-1000:])

    def start_measurements(self):
        meas_thread = threading.Thread(target=self.read_sensor_thread)
        self.reading = True
        meas_thread.daemon = True
        meas_thread.start()

    def stop_measurements(self):
        self.reading = False

    def get_data(self):
        url = "http://192.168.4.1/data" 
        r = requests.get(url=url)

        if r.status_code == 200:
            values = json.loads(r.content)
            self.pressure_points.append(values['pressure'])
            self.temperature_points.append(values['temperature'])
            #self.humidity_points.append(values['humidity'])
            self.timestamps.append(datetime.datetime.now())
            time.sleep(1)
        else:
            raise ValueError(f"Bad status code: {r.status_code}")


output_path = os.path.join(os.getcwd(), 'pressure_data')
if not os.path.exists(output_path):
    os.mkdir(output_path)


root = tkinter.Tk()
app = App()
root.title("UNL Aerospace Club | Aerospace eXperimental Payloads 2022")
root.configure(bg='white')
button = tkinter.Button(root, text="Start Measurements", command=app.start_measurements)
button.pack()
stop_button = tkinter.Button(root, text="Stop Measurements", command=app.stop_measurements)
stop_button.pack()

save_checkbox = tkinter.Checkbutton(root, text='Save Data?', bg='white', variable=app.save_data)
save_checkbox.pack()

fig = Figure(figsize=(5, 5), dpi=100)
plot1 = fig.add_subplot(111)
ax2 = plot1.axes.twinx()
plot1.set_title("Pressure Measurements")
plot1.set_xlabel("Sample")
plot1.set_ylabel("Pressure (hPa)")
canvas = FigureCanvasTkAgg(fig, master=root)
canvas.draw()
ani2 = animation.FuncAnimation(fig, app.plot_data, fargs=([]), interval=250)

canvas.get_tk_widget().pack()
root.mainloop()


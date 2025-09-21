#!/usr/bin/env -S ags run

import app from "ags/gtk4/app"
import { Astal } from "ags/gtk4"
import { createPoll } from "ags/time"

function Corners() {

    return (
            <box>
                <overlay>
                    <box class="sucker">
                        <label label="     "/>
                    </box>

                    <box $type="overlay" class="desucker">
                    </box>

                    <box $type="overlay" class="antisucker">
                    </box>
                </overlay>
            </box>
    )
}

app.start({
  css: `
    window {
      background: transparent;
        font-family: Inter;
        font-weight: bold;
    }


    .time {
        background-color: transparent;
    }
    
    /* Outer container with larger radius */
    .bar {
        background: #191724;
        box-shadow: 0px 0px 0px 5px #191724;
        margin-right: 8px;
        padding-left: 4px;
    }

    label {
      color: #e0def4;
      font-size: 14px;
      margin: 2px 0;
        transform: rotate(-90deg);
    }

    .sucker {
        background-color: transparent;
        border-radius: 50px 0 0 50px;
        box-shadow: 
            0 0 0 16px #191724;
        color: transparent;
    }

    .desucker {
        background-color: transparent;
        border-radius: 50px 0 0 50px;
    }

    .antisucker {
        background-color: transparent;
        border-radius: 50px 0 0 50px;
        box-shadow: 
            0 0px 0 7px #191724;
    }

    .nub {
        margin-left: 8px;
    }
  `,
  main() {
    const { TOP, LEFT, RIGHT, BOTTOM } = Astal.WindowAnchor
    const time = createPoll("", 1000, "date '+%a %d %b %H:%M'")
    
    return (
      <window visible anchor={LEFT | TOP | BOTTOM}>
        <box class="container" orientation={0}>
            <box class="bar" orientation={1}>
              <box class="time" orientation={1}>
                <label label={time} />
              </box>
            </box>
            <box class="nub">
                <Corners/>
            </box>
        </box>
      </window>
    )
  },
})


#!/usr/bin/env lua-any
-- Lua-Versions: 5.3 5.2 5.1

local prefix="PioneerDDJSX3."
local channel={ "[Channel1]","[Channel2]","[Channel3]","[Channel4]" }
local leftright={ "LEFT","RIGHT","LEFT","RIGHT" }

local function control(c,k,d,s,m,g)
	local template=[[
            <control>
                <group>@_GROUP_@</group>
                <key>@_KEY_@</key>
                <description>@_DESCRIPTION_@</description>
                <status>@_STATUS_@</status>
                <midino>@_MIDINO_@</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
]]
	if g then
	  d=d:gsub(g[1],g)
	end
	local out=template:gsub("@_(%w+)_@",{
		GROUP=channel[c],
		KEY=prefix..k,
		DESCRIPTION=d,
		STATUS=("0x%02x"):format(s),
		MIDINO=("0x%02x"):format(m)
	})
	io.write(out)
end

local function output_xml()
	for c=1,4 do
		for p=1,8 do
			local g={"_(%w)_",C=c,P=p}

			control(c,"hotCueButtons","Hot-Cue _P_ Deck _C_, Button: PAD_P_ (in HOT-CUE-Mode, Deck _C_ active)",0x97+c-1,0x00+p-1,g)
			control(c,"clearHotCueButtons","Clear Hot-Cue _P_ Deck _C_, Button: SHIFT &amp; PAD_P_ (in HOT-CUE-Mode, Deck _C_ active)",0x97+c-1,0x08+p-1,g)
		end
	end
end

io.write(
[=[<?xml version='1.0' encoding='utf-8'?>
<MixxxControllerPreset schemaVersion="1" mixxxVersion="2.1+">
    <info>
        <name>Pioneer DDJ-SX3</name>
        <author>Maximilian Beiersdorfer, DJMaxergy</author>
        <description>Pioneer DDJ-SX3 controller mapping</description>
        <forums>http://mixxx.org/forums/viewtopic.php?f=7&amp;t=8310</forums>
        <wiki>http://mixxx.org/wiki/doku.php/pioneer_ddj-sx</wiki>
    </info>
    <controller id="PIONEER">
        <scriptfiles>
            <file functionprefix="" filename="lodash.mixxx.js"/>
            <file functionprefix="" filename="midi-components-0.0.js"/>
            <file functionprefix="PioneerDDJSX3" filename="Pioneer-DDJ-SX3-scripts.js"/>
        </scriptfiles>
        <controls>
]=])
output_xml()
io.write(
[=[
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.parameterLeft</key>
                <description>Halve beatjump_size, Button: PARAMETER2 LEFT (in HOTCUE-Mode, Deck 3 active)</description>
                <status>0x92</status>
                <midino>0x01</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.parameterLeft</key>
                <description>Halve beatjump_size, Button: PARAMETER2 LEFT (in HOTCUE-Mode, Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x01</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.parameterLeft</key>
                <description>Halve beatjump_size, Button: PARAMETER2 LEFT (in HOTCUE-Mode, Deck 1 active)</description>
                <status>0x90</status>
                <midino>0x01</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.parameterLeft</key>
                <description>Halve beatjump_size, Button: PARAMETER2 LEFT (in HOTCUE-Mode, Deck 2 active)</description>
                <status>0x91</status>
                <midino>0x01</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.samplerButtons</key>
                <description>Sampler 6 play, Button: PAD6 (in SAMPLER-Mode, Deck 4 active)</description>
                <status>0x9A</status>
                <midino>0x35</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.filterKnobMSB</key>
                <description>Filter Deck 3 (MSB), Knob: FILTER Deck 3</description>
                <status>0xB6</status>
                <midino>0x19</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.parameterRight</key>
                <description>Double beatjump_size, Button: PARAMETER2 RIGHT (in HOTCUE-Mode, Deck 3 active)</description>
                <status>0x92</status>
                <midino>0x09</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.parameterRight</key>
                <description>Double beatjump_size, Button: PARAMETER2 RIGHT (in HOTCUE-Mode, Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x09</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.samplerButtons</key>
                <description>Sampler 6 play, Button: PAD6 (in SAMPLER-Mode, Deck 2 active)</description>
                <status>0x98</status>
                <midino>0x35</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.parameterRight</key>
                <description>Double beatjump_size, Button: PARAMETER2 RIGHT (in HOTCUE-Mode, Deck 1 active)</description>
                <status>0x90</status>
                <midino>0x09</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.samplerButtons</key>
                <description>Sampler 6 play, Button: PAD6 (in SAMPLER-Mode, Deck 3 active)</description>
                <status>0x99</status>
                <midino>0x35</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.parameterRight</key>
                <description>Double beatjump_size, Button: PARAMETER2 RIGHT (in HOTCUE-Mode, Deck 2 active)</description>
                <status>0x91</status>
                <midino>0x09</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.samplerButtons</key>
                <description>Sampler 6 play, Button: PAD6 (in SAMPLER-Mode, Deck 1 active)</description>
                <status>0x97</status>
                <midino>0x35</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.samplerButtons</key>
                <description>Sampler 2 play, Button: PAD2 (in SAMPLER-Mode, Deck 4 active)</description>
                <status>0x9A</status>
                <midino>0x31</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.jogTouch</key>
                <description>Jog touch (No Vinyl Mode) Deck 3, left JOGDIAL (Deck 3 active)</description>
                <status>0x92</status>
                <midino>0x35</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.jogTouch</key>
                <description>Jog touch (No Vinyl Mode) Deck 4, right JOGDIAL (Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x35</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.samplerButtons</key>
                <description>Sampler 2 play, Button: PAD2 (in SAMPLER-Mode, Deck 2 active)</description>
                <status>0x98</status>
                <midino>0x31</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.jogTouch</key>
                <description>Jog touch (No Vinyl Mode) Deck 1, left JOGDIAL (Deck 1 active)</description>
                <status>0x90</status>
                <midino>0x35</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.samplerButtons</key>
                <description>Sampler 2 play, Button: PAD2 (in SAMPLER-Mode, Deck 3 active)</description>
                <status>0x99</status>
                <midino>0x31</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.jogTouch</key>
                <description>Jog touch (No Vinyl Mode) Deck 2, right JOGDIAL (Deck 2 active)</description>
                <status>0x91</status>
                <midino>0x35</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.samplerButtons</key>
                <description>Sampler 2 play, Button: PAD2 (in SAMPLER-Mode, Deck 1 active)</description>
                <status>0x97</status>
                <midino>0x31</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.stopSamplerButtons</key>
                <description>Sampler 6 stop, Button: SHIFT &amp; PAD6 (in SAMPLER-Mode, Deck 4 active)</description>
                <status>0x9A</status>
                <midino>0x3D</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Master]</group>
                <key>PioneerDDJSX3.crossfaderCurveKnobMSB</key>
                <description>Crossfader Curve adjust (MSB), Knob: Frontpanel CROSSFADER CURVE</description>
                <status>0xB6</status>
                <midino>0x01</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.parameterRight</key>
                <description>Change Pad-Parameter Set (increment), Button: PARAMETER1 RIGHT (in GROUP2-Mode, Deck 3 active)</description>
                <status>0x92</status>
                <midino>0x31</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.parameterRight</key>
                <description>Change Pad-Parameter Set (increment), Button: PARAMETER1 RIGHT (in GROUP2-Mode, Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x31</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.stopSamplerButtons</key>
                <description>Sampler 6 stop, Button: SHIFT &amp; PAD6 (in SAMPLER-Mode, Deck 2 active)</description>
                <status>0x98</status>
                <midino>0x3D</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.parameterRight</key>
                <description>Change Pad-Parameter Set (increment), Button: PARAMETER1 RIGHT (in GROUP2-Mode, Deck 1 active)</description>
                <status>0x90</status>
                <midino>0x31</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.stopSamplerButtons</key>
                <description>Sampler 6 stop, Button: SHIFT &amp; PAD6 (in SAMPLER-Mode, Deck 3 active)</description>
                <status>0x99</status>
                <midino>0x3D</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.parameterRight</key>
                <description>Change Pad-Parameter Set (increment), Button: PARAMETER1 RIGHT (in GROUP2-Mode, Deck 2 active)</description>
                <status>0x91</status>
                <midino>0x31</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.stopSamplerButtons</key>
                <description>Sampler 6 stop, Button: SHIFT &amp; PAD6 (in SAMPLER-Mode, Deck 1 active)</description>
                <status>0x97</status>
                <midino>0x3D</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.stopSamplerButtons</key>
                <description>Sampler 2 stop, Button: SHIFT &amp; PAD2 (in SAMPLER-Mode, Deck 4 active)</description>
                <status>0x9A</status>
                <midino>0x39</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.stopSamplerButtons</key>
                <description>Sampler 2 stop, Button: SHIFT &amp; PAD2 (in SAMPLER-Mode, Deck 2 active)</description>
                <status>0x98</status>
                <midino>0x39</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.stopSamplerButtons</key>
                <description>Sampler 2 stop, Button: SHIFT &amp; PAD2 (in SAMPLER-Mode, Deck 3 active)</description>
                <status>0x99</status>
                <midino>0x39</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.stopSamplerButtons</key>
                <description>Sampler 2 stop, Button: SHIFT &amp; PAD2 (in SAMPLER-Mode, Deck 1 active)</description>
                <status>0x97</status>
                <midino>0x39</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.slicerButtons</key>
                <description>Slicer beatjump/loop Beat 6 Deck 4, Button: PAD6 (in SLICER-Mode, Deck 4 active)</description>
                <status>0x9A</status>
                <midino>0x25</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.slicerButtons</key>
                <description>Slicer beatjump/loop Beat 6 Deck 2, Button: PAD6 (in SLICER-Mode, Deck 2 active)</description>
                <status>0x98</status>
                <midino>0x25</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.slicerButtons</key>
                <description>Slicer beatjump/loop Beat 6 Deck 3, Button: PAD6 (in SLICER-Mode, Deck 3 active)</description>
                <status>0x99</status>
                <midino>0x25</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.samplerVelocityVolume</key>
                <description>Sampler 6 play with velocity volume, Button: PAD6 (in SAMPLER-Mode, VELOCITY active, Deck 4 active)</description>
                <status>0xBA</status>
                <midino>0x35</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.slicerButtons</key>
                <description>Slicer beatjump/loop Beat 6 Deck 1, Button: PAD6 (in SLICER-Mode, Deck 1 active)</description>
                <status>0x97</status>
                <midino>0x25</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.samplerVelocityVolume</key>
                <description>Sampler 6 play with velocity volume, Button: PAD6 (in SAMPLER-Mode, VELOCITY active, Deck 2 active)</description>
                <status>0xB8</status>
                <midino>0x35</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.samplerVelocityVolume</key>
                <description>Sampler 6 play with velocity volume, Button: PAD6 (in SAMPLER-Mode, VELOCITY active, Deck 3 active)</description>
                <status>0xB9</status>
                <midino>0x35</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.slicerButtons</key>
                <description>Slicer beatjump/loop Beat 2 Deck 4, Button: PAD2 (in SLICER-Mode, Deck 4 active)</description>
                <status>0x9A</status>
                <midino>0x21</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.parameterLeft</key>
                <description>Change Pad-Parameter Set (decrement), Button: PARAMETER1 LEFT (in ROLL-Mode, Deck 3 active)</description>
                <status>0x92</status>
                <midino>0x25</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.samplerVelocityVolume</key>
                <description>Sampler 6 play with velocity volume, Button: PAD6 (in SAMPLER-Mode, VELOCITY active, Deck 1 active)</description>
                <status>0xB7</status>
                <midino>0x35</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.parameterLeft</key>
                <description>Change Pad-Parameter Set (decrement), Button: PARAMETER1 LEFT (in ROLL-Mode, Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x25</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.slicerButtons</key>
                <description>Slicer beatjump/loop Beat 2 Deck 2, Button: PAD2 (in SLICER-Mode, Deck 2 active)</description>
                <status>0x98</status>
                <midino>0x21</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.parameterLeft</key>
                <description>Change Pad-Parameter Set (decrement), Button: PARAMETER1 LEFT (in ROLL-Mode, Deck 1 active)</description>
                <status>0x90</status>
                <midino>0x25</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.slicerButtons</key>
                <description>Slicer beatjump/loop Beat 2 Deck 3, Button: PAD2 (in SLICER-Mode, Deck 3 active)</description>
                <status>0x99</status>
                <midino>0x21</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.samplerVelocityVolume</key>
                <description>Sampler 2 play with velocity volume, Button: PAD2 (in SAMPLER-Mode, VELOCITY active, Deck 4 active)</description>
                <status>0xBA</status>
                <midino>0x31</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.parameterLeft</key>
                <description>Change Pad-Parameter Set (decrement), Button: PARAMETER1 LEFT (in ROLL-Mode, Deck 2 active)</description>
                <status>0x91</status>
                <midino>0x25</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.slicerButtons</key>
                <description>Slicer beatjump/loop Beat 2 Deck 1, Button: PAD2 (in SLICER-Mode, Deck 1 active)</description>
                <status>0x97</status>
                <midino>0x21</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.samplerVelocityVolume</key>
                <description>Sampler 2 play with velocity volume, Button: PAD2 (in SAMPLER-Mode, VELOCITY active, Deck 2 active)</description>
                <status>0xB8</status>
                <midino>0x31</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.samplerVelocityVolume</key>
                <description>Sampler 2 play with velocity volume, Button: PAD2 (in SAMPLER-Mode, VELOCITY active, Deck 3 active)</description>
                <status>0xB9</status>
                <midino>0x31</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.samplerVelocityVolume</key>
                <description>Sampler 2 play with velocity volume, Button: PAD2 (in SAMPLER-Mode, VELOCITY active, Deck 1 active)</description>
                <status>0xB7</status>
                <midino>0x31</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.parameterRight</key>
                <description>Change Pad-Parameter Set (increment), Button: PARAMETER1 RIGHT (in ROLL-Mode, Deck 3 active)</description>
                <status>0x92</status>
                <midino>0x2D</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.parameterRight</key>
                <description>Change Pad-Parameter Set (increment), Button: PARAMETER1 RIGHT (in ROLL-Mode, Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x2D</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.parameterRight</key>
                <description>Change Pad-Parameter Set (increment), Button: PARAMETER1 RIGHT (in ROLL-Mode, Deck 1 active)</description>
                <status>0x90</status>
                <midino>0x2D</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.parameterRight</key>
                <description>Change Pad-Parameter Set (increment), Button: PARAMETER1 RIGHT (in ROLL-Mode, Deck 2 active)</description>
                <status>0x91</status>
                <midino>0x2D</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.beatloopButtons</key>
                <description>Beatloop Deck 4, Button: PAD6 (in GROUP2-Mode, Deck 4 active)</description>
                <status>0x9A</status>
                <midino>0x55</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.filterKnobLSB</key>
                <description>Filter Deck 3 (LSB), Knob: FILTER Deck 3</description>
                <status>0xB6</status>
                <midino>0x39</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.parameterLeft</key>
                <description>Change Pad-Parameter Set (decrement), Button: PARAMETER1 LEFT (in GROUP2-Mode, Deck 3 active)</description>
                <status>0x92</status>
                <midino>0x29</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.parameterLeft</key>
                <description>Change Pad-Parameter Set (decrement), Button: PARAMETER1 LEFT (in GROUP2-Mode, Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x29</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.beatloopButtons</key>
                <description>Beatloop Deck 2, Button: PAD6 (in GROUP2-Mode, Deck 2 active)</description>
                <status>0x98</status>
                <midino>0x55</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.parameterLeft</key>
                <description>Change Pad-Parameter Set (decrement), Button: PARAMETER1 LEFT (in GROUP2-Mode, Deck 1 active)</description>
                <status>0x90</status>
                <midino>0x29</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.beatloopButtons</key>
                <description>Beatloop Deck 3, Button: PAD6 (in GROUP2-Mode, Deck 3 active)</description>
                <status>0x99</status>
                <midino>0x55</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.parameterLeft</key>
                <description>Change Pad-Parameter Set (decrement), Button: PARAMETER1 LEFT (in GROUP2-Mode, Deck 2 active)</description>
                <status>0x91</status>
                <midino>0x29</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.fxAssignButton</key>
                <description>Effect Unit 2 assignment Deck 2, Button: FX2 assign Deck 2</description>
                <status>0x96</status>
                <midino>0x55</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.beatloopButtons</key>
                <description>Beatloop Deck 1, Button: PAD6 (in GROUP2-Mode, Deck 1 active)</description>
                <status>0x97</status>
                <midino>0x55</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.beatloopButtons</key>
                <description>Beatloop Deck 4, Button: PAD2 (in GROUP2-Mode, Deck 4 active)</description>
                <status>0x9A</status>
                <midino>0x51</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.beatloopButtons</key>
                <description>Beatloop Deck 2, Button: PAD2 (in GROUP2-Mode, Deck 2 active)</description>
                <status>0x98</status>
                <midino>0x51</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.beatloopButtons</key>
                <description>Beatloop Deck 3, Button: PAD2 (in GROUP2-Mode, Deck 3 active)</description>
                <status>0x99</status>
                <midino>0x51</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.fxAssignButton</key>
                <description>Effect Unit 1 assignment Deck 2, Button: FX1 assign Deck 2</description>
                <status>0x96</status>
                <midino>0x51</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.beatloopButtons</key>
                <description>Beatloop Deck 1, Button: PAD2 (in GROUP2-Mode, Deck 1 active)</description>
                <status>0x97</status>
                <midino>0x51</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Master]</group>
                <key>PioneerDDJSX3.crossfaderCurveKnobLSB</key>
                <description>Crossfader Curve adjust (LSB), Knob: Frontpanel CROSSFADER CURVE</description>
                <status>0xB6</status>
                <midino>0x21</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.jogRingTick</key>
                <description>Jog ring Deck 3, left JOGDIALSIDE (Deck 3 active)</description>
                <status>0xB2</status>
                <midino>0x21</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.jogRingTick</key>
                <description>Jog ring Deck 4, right JOGDIALSIDE (Deck 4 active)</description>
                <status>0xB3</status>
                <midino>0x21</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.jogRingTick</key>
                <description>Jog ring Deck 1, left JOGDIALSIDE (Deck 1 active)</description>
                <status>0xB0</status>
                <midino>0x21</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.jogRingTick</key>
                <description>Jog ring Deck 2, right JOGDIALSIDE (Deck 2 active)</description>
                <status>0xB1</status>
                <midino>0x21</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[AutoDJ]</group>
                <key>PioneerDDJSX3.autoDJToggleSyncKey</key>
                <description>Auto DJ Sync Key, Button: SHIFT &amp; LOAD2</description>
                <status>0x96</status>
                <midino>0x59</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Library]</group>
                <key>PioneerDDJSX3.rotarySelectorClick</key>
                <description>Move focus forward in Library (old: Add selected track to AutoDJ Playlist), Button: BROWSER PRESS</description>
                <status>0x96</status>
                <midino>0x41</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.toggleSamplerVelocityMode</key>
                <description>Toggle Sampler-Pads behaviour: normal (max. volume) / velocity (volume = velocity), Button: SAMPLER Longpress (in SAMPLER-Mode, Deck 3 active)</description>
                <status>0x92</status>
                <midino>0x41</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.toggleSamplerVelocityMode</key>
                <description>Toggle Sampler-Pads behaviour: normal (max. volume) / velocity (volume = velocity), Button: SAMPLER Longpress (in SAMPLER-Mode, Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x41</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.toggleSamplerVelocityMode</key>
                <description>Toggle Sampler-Pads behaviour: normal (max. volume) / velocity (volume = velocity), Button: SAMPLER Longpress (in SAMPLER-Mode, Deck 1 active)</description>
                <status>0x90</status>
                <midino>0x41</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.toggleSamplerVelocityMode</key>
                <description>Toggle Sampler-Pads behaviour: normal (max. volume) / velocity (volume = velocity), Button: SAMPLER Longpress (in SAMPLER-Mode, Deck 2 active)</description>
                <status>0x91</status>
                <midino>0x41</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.loopExitButton</key>
                <description>Manual loop exit Deck 3, Button: SHIFT &amp; LOOP OUT (Deck 3 active)</description>
                <status>0x92</status>
                <midino>0x4D</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.loopExitButton</key>
                <description>Manual loop exit Deck 4, Button: SHIFT &amp; LOOP OUT (Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x4D</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.loopExitButton</key>
                <description>Manual loop exit Deck 1, Button: SHIFT &amp; LOOP OUT (Deck 1 active)</description>
                <status>0x90</status>
                <midino>0x4D</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.loopExitButton</key>
                <description>Manual loop exit Deck 2, Button: SHIFT &amp; LOOP OUT (Deck 2 active)</description>
                <status>0x91</status>
                <midino>0x4D</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.loadButton</key>
                <description>Load selected Deck 4, Button: LOAD Deck 4</description>
                <status>0x96</status>
                <midino>0x49</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[EffectRack1_EffectUnit1]</group>
                <key>PioneerDDJSX3.effectUnit[1].enableButtons[3].input</key>
                <description>Enable (if effectFocusButton pressed: Focus) Effect 3 of Effect Unit 1, Button: FX1-3 ON</description>
                <status>0x94</status>
                <midino>0x49</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[EffectRack1_EffectUnit2]</group>
                <key>PioneerDDJSX3.effectUnit[2].enableButtons[3].input</key>
                <description>Enable (if effectFocusButton pressed: Focus) Effect 3 of Effect Unit 2, Button: FX2-3 ON</description>
                <status>0x95</status>
                <midino>0x49</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Master]</group>
                <key>PioneerDDJSX3.shiftPanelSelectButton</key>
                <description>Enable/show EffectUnit 3 and 4 assignment on FX ASSIGN buttons, Button: left SHIFT + PANEL SELECT</description>
                <status>0x96</status>
                <midino>0x79</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.gridAdjustButton</key>
                <description>Adjust Beat-Grid with jogwheel Deck 3 (hold button), Button: left GRID ADJUST (Deck 3 active)</description>
                <status>0x92</status>
                <midino>0x79</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.gridAdjustButton</key>
                <description>Adjust Beat-Grid with jogwheel Deck 4 (hold button), Button: right GRID ADJUST (Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x79</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.gridAdjustButton</key>
                <description>Adjust Beat-Grid with jogwheel Deck 1 (hold button), Button: left GRID ADJUST (Deck 1 active)</description>
                <status>0x90</status>
                <midino>0x79</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.gridAdjustButton</key>
                <description>Adjust Beat-Grid with jogwheel Deck 2 (hold button), Button: right GRID ADJUST (Deck 2 active)</description>
                <status>0x91</status>
                <midino>0x79</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Library]</group>
                <key>PioneerDDJSX3.backButton</key>
                <description>Move focus backward in Library (old: Skip next track in AutoDJ playlist), Button: BACK</description>
                <status>0x96</status>
                <midino>0x65</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.loopMoveBackButton</key>
                <description>Manual loop move back Deck 3, Button: SHIFT &amp; HALVE LOOP (Deck 3 active)</description>
                <status>0x92</status>
                <midino>0x61</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.loopMoveBackButton</key>
                <description>Manual loop move back Deck 4, Button: SHIFT &amp; HALVE LOOP (Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x61</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.loopMoveBackButton</key>
                <description>Manual loop move back Deck 1, Button: SHIFT &amp; HALVE LOOP (Deck 1 active)</description>
                <status>0x90</status>
                <midino>0x61</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.loopMoveBackButton</key>
                <description>Manual loop move back Deck 2, Button: SHIFT &amp; HALVE LOOP (Deck 2 active)</description>
                <status>0x91</status>
                <midino>0x61</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.beatloopRollButtons</key>
                <description>Auto-Roll 4 Deck 4, Button: PAD7 (in ROLL-Mode, Deck 4 active)</description>
                <status>0x9A</status>
                <midino>0x16</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.beatloopRollButtons</key>
                <description>Auto-Roll 4 Deck 2, Button: PAD7 (in ROLL-Mode, Deck 2 active)</description>
                <status>0x98</status>
                <midino>0x16</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.beatloopRollButtons</key>
                <description>Auto-Roll 4 Deck 3, Button: PAD7 (in ROLL-Mode, Deck 3 active)</description>
                <status>0x99</status>
                <midino>0x16</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.beatloopRollButtons</key>
                <description>Auto-Roll Deck 1, Button: PAD7 (in ROLL-Mode, Deck 1 active)</description>
                <status>0x97</status>
                <midino>0x16</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.beatloopRollButtons</key>
                <description>Auto-Roll 1/4 Deck 4, Button: PAD3 (in ROLL-Mode, Deck 4 active)</description>
                <status>0x9A</status>
                <midino>0x12</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.crossfaderAssignLeft</key>
                <description>Assigns Deck 3 to Crossfader, Switch left: CROSSFADER ASSIGN Deck 3</description>
                <status>0x92</status>
                <midino>0x16</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.crossfaderAssignLeft</key>
                <description>Assigns Deck 4 to Crossfader, Switch left: CROSSFADER ASSIGN Deck 4</description>
                <status>0x93</status>
                <midino>0x16</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.beatloopRollButtons</key>
                <description>Auto-Roll 1/4 Deck 2, Button: PAD3 (in ROLL-Mode, Deck 2 active)</description>
                <status>0x98</status>
                <midino>0x12</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.crossfaderAssignLeft</key>
                <description>Assigns Deck 1 to Crossfader, Switch left: CROSSFADER ASSIGN Deck 1</description>
                <status>0x90</status>
                <midino>0x16</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.beatloopRollButtons</key>
                <description>Auto-Roll 1/4 Deck 3, Button: PAD3 (in ROLL-Mode, Deck 3 active)</description>
                <status>0x99</status>
                <midino>0x12</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.crossfaderAssignLeft</key>
                <description>Assigns Deck 2 to Crossfader, Switch left: CROSSFADER ASSIGN Deck 2</description>
                <status>0x91</status>
                <midino>0x16</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.beatloopRollButtons</key>
                <description>Auto-Roll Deck 1, Button: PAD3 (in ROLL-Mode, Deck 1 active)</description>
                <status>0x97</status>
                <midino>0x12</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.loopHalveButton</key>
                <description>Manual loop half Deck 3, Button: HALVE LOOP (Deck 3 active)</description>
                <status>0x92</status>
                <midino>0x12</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.loopHalveButton</key>
                <description>Manual loop half Deck 4, Button: HALVE LOOP (Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x12</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.loopHalveButton</key>
                <description>Manual loop half Deck 1, Button: HALVE LOOP (Deck 1 active)</description>
                <status>0x90</status>
                <midino>0x12</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.loopHalveButton</key>
                <description>Manual loop half Deck 2, Button: HALVE LOOP (Deck 2 active)</description>
                <status>0x91</status>
                <midino>0x12</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.toggleBeatloopRollMode</key>
                <description>Set PAD-Mode, Button: ROLL LEFT (Deck 3 active)</description>
                <status>0x92</status>
                <midino>0x1E</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.toggleBeatloopRollMode</key>
                <description>Set PAD-Mode, Button: ROLL RIGHT (Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x1E</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.toggleBeatloopRollMode</key>
                <description>Set PAD-Mode, Button: ROLL LEFT (Deck 1 active)</description>
                <status>0x90</status>
                <midino>0x1E</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.toggleBeatloopRollMode</key>
                <description>Set PAD-Mode, Button: ROLL RIGHT (Deck 2 active)</description>
                <status>0x91</status>
                <midino>0x1E</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.keyLockButton</key>
                <description>Key lock Deck 3, Button: left KEYLOCK (Deck 3 active)</description>
                <status>0x92</status>
                <midino>0x1A</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.keyLockButton</key>
                <description>Key lock Deck 4, Button: right KEYLOCK (Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x1A</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.keyLockButton</key>
                <description>Key lock Deck 1, Button: left KEYLOCK (Deck 1 active)</description>
                <status>0x90</status>
                <midino>0x1A</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.keyLockButton</key>
                <description>Key lock Deck 2, Button: right KEYLOCK (Deck 2 active)</description>
                <status>0x91</status>
                <midino>0x1A</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[EffectRack1_EffectUnit1]</group>
                <key>PioneerDDJSX3.effectUnit[1].knobs[3].inputMSB</key>
                <description>FX1 Effect 3 Select (MSB), Knob: SHIFT + FX1-3</description>
                <status>0xB4</status>
                <midino>0x16</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[EffectRack1_EffectUnit2]</group>
                <key>PioneerDDJSX3.effectUnit[2].knobs[3].inputMSB</key>
                <description>FX2 Effect 3 Select (MSB), Knob: SHIFT + FX2-3</description>
                <status>0xB5</status>
                <midino>0x16</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[EffectRack1_EffectUnit1]</group>
                <key>PioneerDDJSX3.effectUnit[1].knobs[1].inputMSB</key>
                <description>FX1 Effect 1 Select (MSB), Knob: SHIFT + FX1-1</description>
                <status>0xB4</status>
                <midino>0x12</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[EffectRack1_EffectUnit2]</group>
                <key>PioneerDDJSX3.effectUnit[2].knobs[1].inputMSB</key>
                <description>FX2 Effect 1 Select (MSB), Knob: SHIFT + FX2-1</description>
                <status>0xB5</status>
                <midino>0x12</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.samplerButtons</key>
                <description>Sampler 7 play, Button: PAD7 (in SAMPLER-Mode, Deck 4 active)</description>
                <status>0x9A</status>
                <midino>0x36</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.filterKnobMSB</key>
                <description>Filter Deck 4 (MSB), Knob: FILTER Deck 4</description>
                <status>0xB6</status>
                <midino>0x1A</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.gridSlideButton</key>
                <description>Move Beat-Grid 1 beat forward/backward with jogwheel Deck 3 (hold button), Button: left GRID SLIDE (Deck 3 active)</description>
                <status>0x92</status>
                <midino>0x0A</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.gridSlideButton</key>
                <description>Move Beat-Grid 1 beat forward/backward with jogwheel Deck 4 (hold button), Button: right GRID SLIDE (Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x0A</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.samplerButtons</key>
                <description>Sampler 7 play, Button: PAD7 (in SAMPLER-Mode, Deck 2 active)</description>
                <status>0x98</status>
                <midino>0x36</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.gridSlideButton</key>
                <description>Move Beat-Grid 1 beat forward/backward with jogwheel Deck 1 (hold button), Button: left GRID SLIDE (Deck 1 active)</description>
                <status>0x90</status>
                <midino>0x0A</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.samplerButtons</key>
                <description>Sampler 7 play, Button: PAD7 (in SAMPLER-Mode, Deck 3 active)</description>
                <status>0x99</status>
                <midino>0x36</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.gridSlideButton</key>
                <description>Move Beat-Grid 1 beat forward/backward with jogwheel Deck 2 (hold button), Button: right GRID SLIDE (Deck 2 active)</description>
                <status>0x91</status>
                <midino>0x0A</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.samplerButtons</key>
                <description>Sampler 7 play, Button: PAD7 (in SAMPLER-Mode, Deck 1 active)</description>
                <status>0x97</status>
                <midino>0x36</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.samplerButtons</key>
                <description>Sampler 3 play, Button: PAD3 (in SAMPLER-Mode, Deck 4 active)</description>
                <status>0x9A</status>
                <midino>0x32</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.jogTouch</key>
                <description>Jog touch (Vinyl Mode) Deck 3, left JOGDIAL (Deck 3 active)</description>
                <status>0x92</status>
                <midino>0x36</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.jogTouch</key>
                <description>Jog touch (Vinyl Mode) Deck 4, right JOGDIAL (Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x36</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.samplerButtons</key>
                <description>Sampler 3 play, Button: PAD3 (in SAMPLER-Mode, Deck 2 active)</description>
                <status>0x98</status>
                <midino>0x32</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[EffectRack1_EffectUnit1]</group>
                <key>PioneerDDJSX3.effectUnit[1].knobs[3].inputMSB</key>
                <description>FX1 Effect 3 Meta (MSB), Knob: FX1-3</description>
                <status>0xB4</status>
                <midino>0x06</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.jogTouch</key>
                <description>Jog touch (Vinyl Mode) Deck 1, left JOGDIAL (Deck 1 active)</description>
                <status>0x90</status>
                <midino>0x36</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.samplerButtons</key>
                <description>Sampler 3 play, Button: PAD3 (in SAMPLER-Mode, Deck 3 active)</description>
                <status>0x99</status>
                <midino>0x32</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[EffectRack1_EffectUnit2]</group>
                <key>PioneerDDJSX3.effectUnit[2].knobs[3].inputMSB</key>
                <description>FX2 Effect 3 Meta (MSB), Knob: FX2-3</description>
                <status>0xB5</status>
                <midino>0x06</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.jogTouch</key>
                <description>Jog touch (Vinyl Mode) Deck 2, right JOGDIAL (Deck 2 active)</description>
                <status>0x91</status>
                <midino>0x36</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.samplerButtons</key>
                <description>Sampler 3 play, Button: PAD3 (in SAMPLER-Mode, Deck 1 active)</description>
                <status>0x97</status>
                <midino>0x32</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.stopSamplerButtons</key>
                <description>Sampler 7 stop, Button: SHIFT &amp; PAD7 (in SAMPLER-Mode, Deck 4 active)</description>
                <status>0x9A</status>
                <midino>0x3E</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.stopSamplerButtons</key>
                <description>Sampler 7 stop, Button: SHIFT &amp; PAD7 (in SAMPLER-Mode, Deck 2 active)</description>
                <status>0x98</status>
                <midino>0x3E</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[EffectRack1_EffectUnit1]</group>
                <key>PioneerDDJSX3.effectUnit[1].knobs[1].inputMSB</key>
                <description>FX1 Effect 1 Meta (MSB), Knob: FX1-1</description>
                <status>0xB4</status>
                <midino>0x02</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.stopSamplerButtons</key>
                <description>Sampler 7 stop, Button: SHIFT &amp; PAD7 (in SAMPLER-Mode, Deck 3 active)</description>
                <status>0x99</status>
                <midino>0x3E</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[EffectRack1_EffectUnit2]</group>
                <key>PioneerDDJSX3.effectUnit[2].knobs[1].inputMSB</key>
                <description>FX2 Effect 1 Meta (MSB), Knob: FX2-1</description>
                <status>0xB5</status>
                <midino>0x02</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.stopSamplerButtons</key>
                <description>Sampler 7 stop, Button: SHIFT &amp; PAD7 (in SAMPLER-Mode, Deck 1 active)</description>
                <status>0x97</status>
                <midino>0x3E</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.stopSamplerButtons</key>
                <description>Sampler 3 stop, Button: SHIFT &amp; PAD3 (in SAMPLER-Mode, Deck 4 active)</description>
                <status>0x9A</status>
                <midino>0x3A</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.stopSamplerButtons</key>
                <description>Sampler 3 stop, Button: SHIFT &amp; PAD3 (in SAMPLER-Mode, Deck 2 active)</description>
                <status>0x98</status>
                <midino>0x3A</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.stopSamplerButtons</key>
                <description>Sampler 3 stop, Button: SHIFT &amp; PAD3 (in SAMPLER-Mode, Deck 3 active)</description>
                <status>0x99</status>
                <midino>0x3A</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.stopSamplerButtons</key>
                <description>Sampler 3 stop, Button: SHIFT &amp; PAD3 (in SAMPLER-Mode, Deck 1 active)</description>
                <status>0x97</status>
                <midino>0x3A</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.slicerButtons</key>
                <description>Slicer beatjump/loop Beat 7 Deck 4, Button: PAD7 (in SLICER-Mode, Deck 4 active)</description>
                <status>0x9A</status>
                <midino>0x26</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.slicerButtons</key>
                <description>Slicer beatjump/loop Beat 7 Deck 2, Button: PAD7 (in SLICER-Mode, Deck 2 active)</description>
                <status>0x98</status>
                <midino>0x26</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.slicerButtons</key>
                <description>Slicer beatjump/loop Beat 7 Deck 3, Button: PAD7 (in SLICER-Mode, Deck 3 active)</description>
                <status>0x99</status>
                <midino>0x26</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.samplerVelocityVolume</key>
                <description>Sampler 7 play with velocity volume, Button: PAD7 (in SAMPLER-Mode, VELOCITY active, Deck 4 active)</description>
                <status>0xBA</status>
                <midino>0x36</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.slicerButtons</key>
                <description>Slicer beatjump/loop Beat 7 Deck 1, Button: PAD7 (in SLICER-Mode, Deck 1 active)</description>
                <status>0x97</status>
                <midino>0x26</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.samplerVelocityVolume</key>
                <description>Sampler 7 play with velocity volume, Button: PAD7 (in SAMPLER-Mode, VELOCITY active, Deck 2 active)</description>
                <status>0xB8</status>
                <midino>0x36</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.samplerVelocityVolume</key>
                <description>Sampler 7 play with velocity volume, Button: PAD7 (in SAMPLER-Mode, VELOCITY active, Deck 3 active)</description>
                <status>0xB9</status>
                <midino>0x36</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.slicerButtons</key>
                <description>Slicer beatjump/loop Beat 3 Deck 4, Button: PAD3 (in SLICER-Mode, Deck 4 active)</description>
                <status>0x9A</status>
                <midino>0x22</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.parameterLeft</key>
                <description>Change Slicer quantization (decrement), Button: PARAMETER1 LEFT (in SLICER-Mode, Deck 3 active)</description>
                <status>0x92</status>
                <midino>0x26</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.samplerVelocityVolume</key>
                <description>Sampler 7 play with velocity volume, Button: PAD7 (in SAMPLER-Mode, VELOCITY active, Deck 1 active)</description>
                <status>0xB7</status>
                <midino>0x36</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.parameterLeft</key>
                <description>Change Slicer quantization (decrement), Button: PARAMETER1 LEFT (in SLICER-Mode, Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x26</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.slicerButtons</key>
                <description>Slicer beatjump/loop Beat 3 Deck 2, Button: PAD3 (in SLICER-Mode, Deck 2 active)</description>
                <status>0x98</status>
                <midino>0x22</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[EffectRack1_EffectUnit1]</group>
                <key>PioneerDDJSX3.effectUnit[1].knobs[3].inputLSB</key>
                <description>FX1 Effect 3 Select (LSB), Knob: SHIFT + FX1-3</description>
                <status>0xB4</status>
                <midino>0x36</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.parameterLeft</key>
                <description>Change Slicer quantization (decrement), Button: PARAMETER1 LEFT (in SLICER-Mode, Deck 1 active)</description>
                <status>0x90</status>
                <midino>0x26</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.slicerButtons</key>
                <description>Slicer beatjump/loop Beat 3 Deck 3, Button: PAD3 (in SLICER-Mode, Deck 3 active)</description>
                <status>0x99</status>
                <midino>0x22</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[EffectRack1_EffectUnit2]</group>
                <key>PioneerDDJSX3.effectUnit[2].knobs[3].inputLSB</key>
                <description>FX2 Effect 3 Select (LSB), Knob: SHIFT + FX2-3</description>
                <status>0xB5</status>
                <midino>0x36</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.samplerVelocityVolume</key>
                <description>Sampler 3 play with velocity volume, Button: PAD3 (in SAMPLER-Mode, VELOCITY active, Deck 4 active)</description>
                <status>0xBA</status>
                <midino>0x32</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.parameterLeft</key>
                <description>Change Slicer quantization (decrement), Button: PARAMETER1 LEFT (in SLICER-Mode, Deck 2 active)</description>
                <status>0x91</status>
                <midino>0x26</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.slicerButtons</key>
                <description>Slicer beatjump/loop Beat 3 Deck 1, Button: PAD3 (in SLICER-Mode, Deck 1 active)</description>
                <status>0x97</status>
                <midino>0x22</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.samplerVelocityVolume</key>
                <description>Sampler 3 play with velocity volume, Button: PAD3 (in SAMPLER-Mode, VELOCITY active, Deck 2 active)</description>
                <status>0xB8</status>
                <midino>0x32</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.samplerVelocityVolume</key>
                <description>Sampler 3 play with velocity volume, Button: PAD3 (in SAMPLER-Mode, VELOCITY active, Deck 3 active)</description>
                <status>0xB9</status>
                <midino>0x32</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.toggleSamplerMode</key>
                <description>Set PAD-Mode, Button: SAMPLER LEFT (Deck 3 active)</description>
                <status>0x92</status>
                <midino>0x22</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.samplerVelocityVolume</key>
                <description>Sampler 3 play with velocity volume, Button: PAD3 (in SAMPLER-Mode, VELOCITY active, Deck 1 active)</description>
                <status>0xB7</status>
                <midino>0x32</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.toggleSamplerMode</key>
                <description>Set PAD-Mode, Button: SAMPLER RIGHT (Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x22</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[EffectRack1_EffectUnit1]</group>
                <key>PioneerDDJSX3.effectUnit[1].knobs[1].inputLSB</key>
                <description>FX1 Effect 1 Select (LSB), Knob: SHIFT + FX1-1</description>
                <status>0xB4</status>
                <midino>0x32</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.toggleSamplerMode</key>
                <description>Set PAD-Mode, Button: SAMPLER LEFT (Deck 1 active)</description>
                <status>0x90</status>
                <midino>0x22</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[EffectRack1_EffectUnit2]</group>
                <key>PioneerDDJSX3.effectUnit[2].knobs[1].inputLSB</key>
                <description>FX2 Effect 1 Select (LSB), Knob: SHIFT + FX2-1</description>
                <status>0xB5</status>
                <midino>0x32</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.toggleSamplerMode</key>
                <description>Set PAD-Mode, Button: SAMPLER RIGHT (Deck 2 active)</description>
                <status>0x91</status>
                <midino>0x22</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.parameterRight</key>
                <description>Change Slicer quantization (increment), Button: PARAMETER1 RIGHT (in SLICER-Mode, Deck 3 active)</description>
                <status>0x92</status>
                <midino>0x2E</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.parameterRight</key>
                <description>Change Slicer quantization (increment), Button: PARAMETER1 RIGHT (in SLICER-Mode, Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x2E</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.parameterRight</key>
                <description>Change Slicer quantization (increment), Button: PARAMETER1 RIGHT (in SLICER-Mode, Deck 1 active)</description>
                <status>0x90</status>
                <midino>0x2E</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.parameterRight</key>
                <description>Change Slicer quantization (increment), Button: PARAMETER1 RIGHT (in SLICER-Mode, Deck 2 active)</description>
                <status>0x91</status>
                <midino>0x2E</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.beatloopButtons</key>
                <description>Beatloop Deck 4, Button: PAD7 (in GROUP2-Mode, Deck 4 active)</description>
                <status>0x9A</status>
                <midino>0x56</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.filterKnobLSB</key>
                <description>Filter Deck 4 (LSB), Knob: FILTER Deck 4</description>
                <status>0xB6</status>
                <midino>0x3A</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.beatloopButtons</key>
                <description>Beatloop Deck 2, Button: PAD7 (in GROUP2-Mode, Deck 2 active)</description>
                <status>0x98</status>
                <midino>0x56</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.beatloopButtons</key>
                <description>Beatloop Deck 3, Button: PAD7 (in GROUP2-Mode, Deck 3 active)</description>
                <status>0x99</status>
                <midino>0x56</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.fxAssignButton</key>
                <description>Effect Unit 2 assignment Deck 3, Button: FX2 assign Deck 3</description>
                <status>0x96</status>
                <midino>0x56</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.beatloopButtons</key>
                <description>Beatloop Deck 1, Button: PAD7 (in GROUP2-Mode, Deck 1 active)</description>
                <status>0x97</status>
                <midino>0x56</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.beatloopButtons</key>
                <description>Beatloop Deck 4, Button: PAD3 (in GROUP2-Mode, Deck 4 active)</description>
                <status>0x9A</status>
                <midino>0x52</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.beatloopButtons</key>
                <description>Beatloop Deck 2, Button: PAD3 (in GROUP2-Mode, Deck 2 active)</description>
                <status>0x98</status>
                <midino>0x52</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[EffectRack1_EffectUnit1]</group>
                <key>PioneerDDJSX3.effectUnit[1].knobs[3].inputLSB</key>
                <description>FX1 Effect 3 Meta (LSB), Knob: FX1-3</description>
                <status>0xB4</status>
                <midino>0x26</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.beatloopButtons</key>
                <description>Beatloop Deck 3, Button: PAD3 (in GROUP2-Mode, Deck 3 active)</description>
                <status>0x99</status>
                <midino>0x52</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[EffectRack1_EffectUnit2]</group>
                <key>PioneerDDJSX3.effectUnit[2].knobs[3].inputLSB</key>
                <description>FX2 Effect 3 Meta (LSB), Knob: FX2-3</description>
                <status>0xB5</status>
                <midino>0x26</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.fxAssignButton</key>
                <description>Effect Unit 1 assignment Deck 3, Button: FX1 assign Deck 3</description>
                <status>0x96</status>
                <midino>0x52</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.jogRingTickShift</key>
                <description>Jog ring shift Deck 3, SHIFT left JOGDIALSIDE (Deck 3 active)</description>
                <status>0xB2</status>
                <midino>0x26</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.beatloopButtons</key>
                <description>Beatloop Deck 1, Button: PAD3 (in GROUP2-Mode, Deck 1 active)</description>
                <status>0x97</status>
                <midino>0x52</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.jogRingTickShift</key>
                <description>Jog ring shift Deck 4, SHIFT right JOGDIALSIDE (Deck 4 active)</description>
                <status>0xB3</status>
                <midino>0x26</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.jogRingTickShift</key>
                <description>Jog ring shift Deck 1, SHIFT left JOGDIALSIDE (Deck 1 active)</description>
                <status>0xB0</status>
                <midino>0x26</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.jogRingTickShift</key>
                <description>Jog ring shift Deck 2, SHIFT right JOGDIALSIDE (Deck 2 active)</description>
                <status>0xB1</status>
                <midino>0x26</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[EffectRack1_EffectUnit1]</group>
                <key>PioneerDDJSX3.effectUnit[1].knobs[1].inputLSB</key>
                <description>FX1 Effect 1 Meta (LSB), Knob: FX1-1</description>
                <status>0xB4</status>
                <midino>0x22</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[EffectRack1_EffectUnit2]</group>
                <key>PioneerDDJSX3.effectUnit[2].knobs[1].inputLSB</key>
                <description>FX2 Effect 1 Meta (LSB), Knob: FX2-1</description>
                <status>0xB5</status>
                <midino>0x22</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.jogPlatterTick</key>
                <description>Jog (Vinyl Mode) Deck 3, left JOGDIAL (Deck 3 active)</description>
                <status>0xB2</status>
                <midino>0x22</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.jogPlatterTick</key>
                <description>Jog (Vinyl Mode) Deck 4, right JOGDIAL (Deck 4 active)</description>
                <status>0xB3</status>
                <midino>0x22</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.jogPlatterTick</key>
                <description>Jog (Vinyl Mode) Deck 1, left JOGDIAL (Deck 1 active)</description>
                <status>0xB0</status>
                <midino>0x22</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.jogPlatterTick</key>
                <description>Jog (Vinyl Mode) Deck 2, right JOGDIAL (Deck 2 active)</description>
                <status>0xB1</status>
                <midino>0x22</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.loadButton</key>
                <description>Load selected Deck 1, Button: LOAD Deck 1</description>
                <status>0x96</status>
                <midino>0x46</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Library]</group>
                <key>PioneerDDJSX3.rotarySelectorShiftedClick</key>
                <description>Choose item (double click on selected item) (old: Expand/collapse selected sidebar item), Button: SHIFT &amp; BROWSER PRESS</description>
                <status>0x96</status>
                <midino>0x42</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[EffectRack1_EffectUnit1]</group>
                <key>PioneerDDJSX3.effectUnit[1].effectFocusButton.input</key>
                <description>Press hold: Enables effect focus selection, Shortpress: Toggles effect focus mode of EffectUnit 1, Button: FX1 TAP</description>
                <status>0x94</status>
                <midino>0x4A</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[EffectRack1_EffectUnit2]</group>
                <key>PioneerDDJSX3.effectUnit[2].effectFocusButton.input</key>
                <description>Press hold: Enables effect focus selection, Shortpress: Toggles effect focus mode of EffectUnit 2, Button: FX2 TAP</description>
                <status>0x95</status>
                <midino>0x4A</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Master]</group>
                <key>PioneerDDJSX3.shiftBackButton</key>
                <description>Toggle maximized view of Library, Button: SHIFT &amp; BACK</description>
                <status>0x96</status>
                <midino>0x66</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[EffectRack1_EffectUnit1]</group>
                <key>PioneerDDJSX3.effectUnit[1].effectFocusButton.input</key>
                <description>Switch between EffectUnits, Button: SHIFT &amp; FX1 TAP</description>
                <status>0x94</status>
                <midino>0x66</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[EffectRack1_EffectUnit2]</group>
                <key>PioneerDDJSX3.effectUnit[2].effectFocusButton.input</key>
                <description>Switch between EffectUnits, Button: SHIFT &amp; FX2 TAP</description>
                <status>0x95</status>
                <midino>0x66</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Master]</group>
                <key>PioneerDDJSX3.headphoneSplitCueButton</key>
                <description>Split headphone cueing (right = master mono and left = pfl mono), Button: SHIFT &amp; MASTER CUE</description>
                <status>0x96</status>
                <midino>0x62</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.loopMoveForwardButton</key>
                <description>Manual loop move forward Deck 3, Button: SHIFT &amp; DOUBLE LOOP (Deck 3 active)</description>
                <status>0x92</status>
                <midino>0x62</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.loopMoveForwardButton</key>
                <description>Manual loop move forward Deck 4, Button: SHIFT &amp; DOUBLE LOOP (Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x62</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.loopMoveForwardButton</key>
                <description>Manual loop move forward Deck 1, Button: SHIFT &amp; DOUBLE LOOP (Deck 1 active)</description>
                <status>0x90</status>
                <midino>0x62</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.loopMoveForwardButton</key>
                <description>Manual loop move forward Deck 2, Button: SHIFT &amp; DOUBLE LOOP (Deck 2 active)</description>
                <status>0x91</status>
                <midino>0x62</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.beatloopRollButtons</key>
                <description>Auto-Roll 8 Deck 4, Button: PAD8 (in ROLL-Mode, Deck 4 active)</description>
                <status>0x9A</status>
                <midino>0x17</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.beatloopRollButtons</key>
                <description>Auto-Roll 8 Deck 2, Button: PAD8 (in ROLL-Mode, Deck 2 active)</description>
                <status>0x98</status>
                <midino>0x17</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.beatloopRollButtons</key>
                <description>Auto-Roll 8 Deck 3, Button: PAD8 (in ROLL-Mode, Deck 3 active)</description>
                <status>0x99</status>
                <midino>0x17</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.beatloopRollButtons</key>
                <description>Auto-Roll Deck 1, Button: PAD8 (in ROLL-Mode, Deck 1 active)</description>
                <status>0x97</status>
                <midino>0x17</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.beatloopRollButtons</key>
                <description>Auto-Roll 1/2 Deck 4, Button: PAD4 (in ROLL-Mode, Deck 4 active)</description>
                <status>0x9A</status>
                <midino>0x13</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.vinylButton</key>
                <description>Vinyl Deck 3, Button: left VINYL (Deck 3 active)</description>
                <status>0x92</status>
                <midino>0x17</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.vinylButton</key>
                <description>Vinyl Deck 4, Button: right VINYL (Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x17</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.beatloopRollButtons</key>
                <description>Auto-Roll 1/2 Deck 2, Button: PAD4 (in ROLL-Mode, Deck 2 active)</description>
                <status>0x98</status>
                <midino>0x13</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.vinylButton</key>
                <description>Vinyl Deck 1, Button: left VINYL (Deck 1 active)</description>
                <status>0x90</status>
                <midino>0x17</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.beatloopRollButtons</key>
                <description>Auto-Roll 1/2 Deck 3, Button: PAD4 (in ROLL-Mode, Deck 3 active)</description>
                <status>0x99</status>
                <midino>0x13</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.vinylButton</key>
                <description>Vinyl Deck 2, Button: right VINYL (Deck 2 active)</description>
                <status>0x91</status>
                <midino>0x17</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.beatloopRollButtons</key>
                <description>Auto-Roll Deck 1, Button: PAD4 (in ROLL-Mode, Deck 1 active)</description>
                <status>0x97</status>
                <midino>0x13</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.loopDoubleButton</key>
                <description>Manual loop double Deck 3, Button: DOUBLE LOOP (Deck 3 active)</description>
                <status>0x92</status>
                <midino>0x13</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.loopDoubleButton</key>
                <description>Manual loop double Deck 4, Button: DOUBLE LOOP (Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x13</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.loopDoubleButton</key>
                <description>Manual loop double Deck 1, Button: DOUBLE LOOP (Deck 1 active)</description>
                <status>0x90</status>
                <midino>0x13</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.loopDoubleButton</key>
                <description>Manual loop double Deck 2, Button: DOUBLE LOOP (Deck 2 active)</description>
                <status>0x91</status>
                <midino>0x13</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.toggleHotCueMode</key>
                <description>Set PAD-Mode, Button: HOT CUE LEFT (Deck 3 active)</description>
                <status>0x92</status>
                <midino>0x1B</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.toggleHotCueMode</key>
                <description>Set PAD-Mode, Button: HOT CUE RIGHT (Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x1B</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.toggleHotCueMode</key>
                <description>Set PAD-Mode, Button: HOT CUE LEFT (Deck 1 active)</description>
                <status>0x90</status>
                <midino>0x1B</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.toggleHotCueMode</key>
                <description>Set PAD-Mode, Button: HOT CUE RIGHT (Deck 2 active)</description>
                <status>0x91</status>
                <midino>0x1B</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.filterKnobMSB</key>
                <description>Filter Deck 1 (MSB), Knob: FILTER Deck 1</description>
                <status>0xB6</status>
                <midino>0x17</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.shiftParameterLeft</key>
                <description>Change Slicer domain (decrement), Button: PARAMETER2 LEFT (in SLICER-Mode, Deck 3 active)</description>
                <status>0x92</status>
                <midino>0x03</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.shiftParameterLeft</key>
                <description>Change Slicer domain (decrement), Button: PARAMETER2 LEFT (in SLICER-Mode, Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x03</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.shiftParameterLeft</key>
                <description>Change Slicer domain (decrement), Button: PARAMETER2 LEFT (in SLICER-Mode, Deck 1 active)</description>
                <status>0x90</status>
                <midino>0x03</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.shiftParameterLeft</key>
                <description>Change Slicer domain (decrement), Button: PARAMETER2 LEFT (in SLICER-Mode, Deck 2 active)</description>
                <status>0x91</status>
                <midino>0x03</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.deckFaderMSB</key>
                <description>Channel fader Deck 3 (MSB), Slider: CHANNELFADER Deck 3</description>
                <status>0xB2</status>
                <midino>0x13</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.deckFaderMSB</key>
                <description>Channel fader Deck 4 (MSB), Slider: CHANNELFADER Deck 4</description>
                <status>0xB3</status>
                <midino>0x13</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.deckFaderMSB</key>
                <description>Channel fader Deck 1 (MSB), Slider: CHANNELFADER Deck 1</description>
                <status>0xB0</status>
                <midino>0x13</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.deckFaderMSB</key>
                <description>Channel fader Deck 2 (MSB), Slider: CHANNELFADER Deck 2</description>
                <status>0xB1</status>
                <midino>0x13</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Master]</group>
                <key>PioneerDDJSX3.crossFaderMSB</key>
                <description>Crossfader (MSB), Slider: FADE</description>
                <status>0xB6</status>
                <midino>0x1F</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.jogPlatterTickShift</key>
                <description>Jog fast Deck 3, SHIFT left JOGDIAL (Deck 3 active)</description>
                <status>0xB2</status>
                <midino>0x1F</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.jogPlatterTickShift</key>
                <description>Jog fast Deck 4, SHIFT right JOGDIAL (Deck 4 active)</description>
                <status>0xB3</status>
                <midino>0x1F</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.samplerButtons</key>
                <description>Sampler 8 play, Button: PAD8 (in SAMPLER-Mode, Deck 4 active)</description>
                <status>0x9A</status>
                <midino>0x37</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.jogPlatterTickShift</key>
                <description>Jog fast Deck 1, SHIFT left JOGDIAL (Deck 1 active)</description>
                <status>0xB0</status>
                <midino>0x1F</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.playButton</key>
                <description>Toggles Play/Pause Deck 3, Button: left PLAY (Deck 3 active)</description>
                <status>0x92</status>
                <midino>0x0B</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.jogPlatterTickShift</key>
                <description>Jog fast Deck 2, SHIFT right JOGDIAL (Deck 2 active)</description>
                <status>0xB1</status>
                <midino>0x1F</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.playButton</key>
                <description>Toggles Play/Pause Deck 4, Button: right PLAY (Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x0B</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.samplerButtons</key>
                <description>Sampler 8 play, Button: PAD8 (in SAMPLER-Mode, Deck 2 active)</description>
                <status>0x98</status>
                <midino>0x37</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.playButton</key>
                <description>Toggles Play/Pause Deck 1, Button: left PLAY (Deck 1 active)</description>
                <status>0x90</status>
                <midino>0x0B</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.samplerButtons</key>
                <description>Sampler 8 play, Button: PAD8 (in SAMPLER-Mode, Deck 3 active)</description>
                <status>0x99</status>
                <midino>0x37</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.playButton</key>
                <description>Toggles Play/Pause Deck 2, Button: right PLAY (Deck 2 active)</description>
                <status>0x91</status>
                <midino>0x0B</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.samplerButtons</key>
                <description>Sampler 8 play, Button: PAD8 (in SAMPLER-Mode, Deck 1 active)</description>
                <status>0x97</status>
                <midino>0x37</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.samplerButtons</key>
                <description>Sampler 4 play, Button: PAD4 (in SAMPLER-Mode, Deck 4 active)</description>
                <status>0x9A</status>
                <midino>0x33</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.samplerButtons</key>
                <description>Sampler 4 play, Button: PAD4 (in SAMPLER-Mode, Deck 2 active)</description>
                <status>0x98</status>
                <midino>0x33</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.samplerButtons</key>
                <description>Sampler 4 play, Button: PAD4 (in SAMPLER-Mode, Deck 3 active)</description>
                <status>0x99</status>
                <midino>0x33</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.filterHighKnobMSB</key>
                <description>High level Deck 3 (MSB), Knob: HI Deck 3</description>
                <status>0xB2</status>
                <midino>0x07</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.samplerButtons</key>
                <description>Sampler 4 play, Button: PAD4 (in SAMPLER-Mode, Deck 1 active)</description>
                <status>0x97</status>
                <midino>0x33</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.filterHighKnobMSB</key>
                <description>High level Deck 4 (MSB), Knob: HI Deck 4</description>
                <status>0xB3</status>
                <midino>0x07</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.filterHighKnobMSB</key>
                <description>High level Deck 1 (MSB), Knob: HI Deck 1</description>
                <status>0xB0</status>
                <midino>0x07</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.stopSamplerButtons</key>
                <description>Sampler 8 stop, Button: SHIFT &amp; PAD8 (in SAMPLER-Mode, Deck 4 active)</description>
                <status>0x9A</status>
                <midino>0x3F</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.filterHighKnobMSB</key>
                <description>High level Deck 2 (MSB), Knob: HI Deck 2</description>
                <status>0xB1</status>
                <midino>0x07</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Samplers]</group>
                <key>PioneerDDJSX3.samplerVolumeFaderMSB</key>
                <description>Sampler Volume fader (MSB), Slider: SAMPLER VOLUME</description>
                <status>0xB6</status>
                <midino>0x03</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.stopSamplerButtons</key>
                <description>Sampler 8 stop, Button: SHIFT &amp; PAD8 (in SAMPLER-Mode, Deck 2 active)</description>
                <status>0x98</status>
                <midino>0x3F</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.stopSamplerButtons</key>
                <description>Sampler 8 stop, Button: SHIFT &amp; PAD8 (in SAMPLER-Mode, Deck 3 active)</description>
                <status>0x99</status>
                <midino>0x3F</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.needleSearchStripPosition</key>
                <description>Jump to track position (Needle Search) Deck 3, Touch: left NEEDLE SEARCH (Deck 3 active)</description>
                <status>0xB2</status>
                <midino>0x03</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.stopSamplerButtons</key>
                <description>Sampler 8 stop, Button: SHIFT &amp; PAD8 (in SAMPLER-Mode, Deck 1 active)</description>
                <status>0x97</status>
                <midino>0x3F</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.needleSearchStripPosition</key>
                <description>Jump to track position (Needle Search) Deck 4, Touch: right NEEDLE SEARCH (Deck 4 active)</description>
                <status>0xB3</status>
                <midino>0x03</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.needleSearchStripPosition</key>
                <description>Jump to track position (Needle Search) Deck 1, Touch: left NEEDLE SEARCH (Deck 1 active)</description>
                <status>0xB0</status>
                <midino>0x03</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.stopSamplerButtons</key>
                <description>Sampler 4 stop, Button: SHIFT &amp; PAD4 (in SAMPLER-Mode, Deck 4 active)</description>
                <status>0x9A</status>
                <midino>0x3B</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.needleSearchStripPosition</key>
                <description>Jump to track position (Needle Search) Deck 2, Touch: right NEEDLE SEARCH (Deck 2 active)</description>
                <status>0xB1</status>
                <midino>0x03</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.shiftButton</key>
                <description>Shift Deck 3, Button: left SHIFT (Deck 3 active)</description>
                <status>0x92</status>
                <midino>0x3F</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.shiftButton</key>
                <description>Shift Deck 4, Button: right SHIFT (Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x3F</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.stopSamplerButtons</key>
                <description>Sampler 4 stop, Button: SHIFT &amp; PAD4 (in SAMPLER-Mode, Deck 2 active)</description>
                <status>0x98</status>
                <midino>0x3B</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.shiftButton</key>
                <description>Shift Deck 1, Button: left SHIFT (Deck 1 active)</description>
                <status>0x90</status>
                <midino>0x3F</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.stopSamplerButtons</key>
                <description>Sampler 4 stop, Button: SHIFT &amp; PAD4 (in SAMPLER-Mode, Deck 3 active)</description>
                <status>0x99</status>
                <midino>0x3B</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.shiftButton</key>
                <description>Shift Deck 2, Button: right SHIFT (Deck 2 active)</description>
                <status>0x91</status>
                <midino>0x3F</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.filterLowKnobMSB</key>
                <description>Low level Deck 3 (MSB), Knob: LOW Deck 3</description>
                <status>0xB2</status>
                <midino>0x0F</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.stopSamplerButtons</key>
                <description>Sampler 4 stop, Button: SHIFT &amp; PAD4 (in SAMPLER-Mode, Deck 1 active)</description>
                <status>0x97</status>
                <midino>0x3B</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.filterLowKnobMSB</key>
                <description>Low level Deck 4 (MSB), Knob: LOW Deck 4</description>
                <status>0xB3</status>
                <midino>0x0F</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.filterLowKnobMSB</key>
                <description>Low level Deck 1 (MSB), Knob: LOW Deck 1</description>
                <status>0xB0</status>
                <midino>0x0F</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.slicerButtons</key>
                <description>Slicer beatjump/loop Beat 8 Deck 4, Button: PAD8 (in SLICER-Mode, Deck 4 active)</description>
                <status>0x9A</status>
                <midino>0x27</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.filterLowKnobMSB</key>
                <description>Low level Deck 2 (MSB), Knob: LOW Deck 2</description>
                <status>0xB1</status>
                <midino>0x0F</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.slicerButtons</key>
                <description>Slicer beatjump/loop Beat 8 Deck 2, Button: PAD8 (in SLICER-Mode, Deck 2 active)</description>
                <status>0x98</status>
                <midino>0x27</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.slicerButtons</key>
                <description>Slicer beatjump/loop Beat 8 Deck 3, Button: PAD8 (in SLICER-Mode, Deck 3 active)</description>
                <status>0x99</status>
                <midino>0x27</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.samplerVelocityVolume</key>
                <description>Sampler 8 play with velocity volume, Button: PAD8 (in SAMPLER-Mode, VELOCITY active, Deck 4 active)</description>
                <status>0xBA</status>
                <midino>0x37</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.filterMidKnobMSB</key>
                <description>Mid level Deck 3 (MSB), Knob: MID Deck 3</description>
                <status>0xB2</status>
                <midino>0x0B</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.slicerButtons</key>
                <description>Slicer beatjump/loop Beat 8 Deck 1, Button: PAD8 (in SLICER-Mode, Deck 1 active)</description>
                <status>0x97</status>
                <midino>0x27</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.filterMidKnobMSB</key>
                <description>Mid level Deck 4 (MSB), Knob: MID Deck 4</description>
                <status>0xB3</status>
                <midino>0x0B</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.samplerVelocityVolume</key>
                <description>Sampler 8 play with velocity volume, Button: PAD8 (in SAMPLER-Mode, VELOCITY active, Deck 2 active)</description>
                <status>0xB8</status>
                <midino>0x37</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.filterMidKnobMSB</key>
                <description>Mid level Deck 1 (MSB), Knob: MID Deck 1</description>
                <status>0xB0</status>
                <midino>0x0B</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.samplerVelocityVolume</key>
                <description>Sampler 8 play with velocity volume, Button: PAD8 (in SAMPLER-Mode, VELOCITY active, Deck 3 active)</description>
                <status>0xB9</status>
                <midino>0x37</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.slicerButtons</key>
                <description>Slicer beatjump/loop Beat 4 Deck 4, Button: PAD4 (in SLICER-Mode, Deck 4 active)</description>
                <status>0x9A</status>
                <midino>0x23</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.filterMidKnobMSB</key>
                <description>Mid level Deck 2 (MSB), Knob: HI Deck 2</description>
                <status>0xB1</status>
                <midino>0x0B</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.filterKnobLSB</key>
                <description>Filter Deck 1 (LSB), Knob: FILTER Deck 1</description>
                <status>0xB6</status>
                <midino>0x37</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.parameterLeft</key>
                <description>Change Sampler bank (decrement), Button: PARAMETER1 LEFT (in SAMPLER-Mode, Deck 3 active)</description>
                <status>0x92</status>
                <midino>0x27</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.samplerVelocityVolume</key>
                <description>Sampler 8 play with velocity volume, Button: PAD8 (in SAMPLER-Mode, VELOCITY active, Deck 1 active)</description>
                <status>0xB7</status>
                <midino>0x37</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.parameterLeft</key>
                <description>Change Sampler bank (decrement), Button: PARAMETER1 LEFT (in SAMPLER-Mode, Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x27</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.slicerButtons</key>
                <description>Slicer beatjump/loop Beat 4 Deck 2, Button: PAD4 (in SLICER-Mode, Deck 1 active)</description>
                <status>0x98</status>
                <midino>0x23</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.parameterLeft</key>
                <description>Change Sampler bank (decrement), Button: PARAMETER1 LEFT (in SAMPLER-Mode, Deck 1 active)</description>
                <status>0x90</status>
                <midino>0x27</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.slicerButtons</key>
                <description>Slicer beatjump/loop Beat 4 Deck 3, Button: PAD4 (in SLICER-Mode, Deck 3 active)</description>
                <status>0x99</status>
                <midino>0x23</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.samplerVelocityVolume</key>
                <description>Sampler 4 play with velocity volume, Button: PAD4 (in SAMPLER-Mode, VELOCITY active, Deck 4 active)</description>
                <status>0xBA</status>
                <midino>0x33</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.parameterLeft</key>
                <description>Change Sampler bank (decrement), Button: PARAMETER1 LEFT (in SAMPLER-Mode, Deck 2 active)</description>
                <status>0x91</status>
                <midino>0x27</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.slicerButtons</key>
                <description>Slicer beatjump/loop Beat 4 Deck 1, Button: PAD4 (in SLICER-Mode, Deck 1 active)</description>
                <status>0x97</status>
                <midino>0x23</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.samplerVelocityVolume</key>
                <description>Sampler 4 play with velocity volume, Button: PAD4 (in SAMPLER-Mode, VELOCITY active, Deck 2 active)</description>
                <status>0xB8</status>
                <midino>0x33</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.samplerVelocityVolume</key>
                <description>Sampler 4 play with velocity volume, Button: PAD4 (in SAMPLER-Mode, VELOCITY active, Deck 3 active)</description>
                <status>0xB9</status>
                <midino>0x33</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.samplerVelocityVolume</key>
                <description>Sampler 4 play with velocity volume, Button: PAD4 (in SAMPLER-Mode, VELOCITY active, Deck 1 active)</description>
                <status>0xB7</status>
                <midino>0x33</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.deckFaderLSB</key>
                <description>Channel fader Deck 3 (LSB), Slider: CHANNELFADER Deck 3</description>
                <status>0xB2</status>
                <midino>0x33</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.deckFaderLSB</key>
                <description>Channel fader Deck 4 (LSB), Slider: CHANNELFADER Deck 4</description>
                <status>0xB3</status>
                <midino>0x33</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.deckFaderLSB</key>
                <description>Channel fader Deck 1 (LSB), Slider: CHANNELFADER Deck 1</description>
                <status>0xB0</status>
                <midino>0x33</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.deckFaderLSB</key>
                <description>Channel fader Deck 2 (LSB), Slider: CHANNELFADER Deck 2</description>
                <status>0xB1</status>
                <midino>0x33</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Master]</group>
                <key>PioneerDDJSX3.crossFaderLSB</key>
                <description>Crossfader (LSB), Slider: FADE</description>
                <status>0xB6</status>
                <midino>0x3F</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.parameterRight</key>
                <description>Change Sampler bank (increment), Button: PARAMETER1 RIGHT (in SAMPLER-Mode, Deck 3 active)</description>
                <status>0x92</status>
                <midino>0x2F</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.parameterRight</key>
                <description>Change Sampler bank (increment), Button: PARAMETER1 RIGHT (in SAMPLER-Mode, Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x2F</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.parameterRight</key>
                <description>Change Sampler bank (increment), Button: PARAMETER1 RIGHT (in SAMPLER-Mode, Deck 1 active)</description>
                <status>0x90</status>
                <midino>0x2F</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.parameterRight</key>
                <description>Change Sampler bank (increment), Button: PARAMETER1 RIGHT (in SAMPLER-Mode, Deck 2 active)</description>
                <status>0x91</status>
                <midino>0x2F</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.beatloopButtons</key>
                <description>Beatloop Deck 4, Button: PAD8 (in GROUP2-Mode, Deck 4 active)</description>
                <status>0x9A</status>
                <midino>0x57</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.beatloopButtons</key>
                <description>Beatloop Deck 2, Button: PAD8 (in GROUP2-Mode, Deck 2 active)</description>
                <status>0x98</status>
                <midino>0x57</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.beatloopButtons</key>
                <description>Beatloop Deck 3, Button: PAD8 (in GROUP2-Mode, Deck 3 active)</description>
                <status>0x99</status>
                <midino>0x57</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.fxAssignButton</key>
                <description>Effect Unit 2 assignment Deck 4, Button: FX2 assign Deck 4</description>
                <status>0x96</status>
                <midino>0x57</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.beatloopButtons</key>
                <description>Beatloop Deck 1, Button: PAD8 (in GROUP2-Mode, Deck 1 active)</description>
                <status>0x97</status>
                <midino>0x57</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.beatloopButtons</key>
                <description>Beatloop Deck 4, Button: PAD4 (in GROUP2-Mode, Deck 4 active)</description>
                <status>0x9A</status>
                <midino>0x53</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.beatloopButtons</key>
                <description>Beatloop Deck 2, Button: PAD4 (in GROUP2-Mode, Deck 2 active)</description>
                <status>0x98</status>
                <midino>0x53</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.beatloopButtons</key>
                <description>Beatloop Deck 3, Button: PAD4 (in GROUP2-Mode, Deck 3 active)</description>
                <status>0x99</status>
                <midino>0x53</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.fxAssignButton</key>
                <description>Effect Unit 1 assignment Deck 4, Button: FX1 assign Deck 4</description>
                <status>0x96</status>
                <midino>0x53</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.filterHighKnobLSB</key>
                <description>High level Deck 3 (LSB), Knob: HI Deck 3</description>
                <status>0xB2</status>
                <midino>0x27</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.beatloopButtons</key>
                <description>Beatloop Deck 1, Button: PAD4 (in GROUP2-Mode, Deck 1 active)</description>
                <status>0x97</status>
                <midino>0x53</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.filterHighKnobLSB</key>
                <description>High level Deck 4 (LSB), Knob: HI Deck 4</description>
                <status>0xB3</status>
                <midino>0x27</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.filterHighKnobLSB</key>
                <description>High level Deck 1 (LSB), Knob: HI Deck 1</description>
                <status>0xB0</status>
                <midino>0x27</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.filterHighKnobLSB</key>
                <description>High level Deck 2 (LSB), Knob: HI Deck 2</description>
                <status>0xB1</status>
                <midino>0x27</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Samplers]</group>
                <key>PioneerDDJSX3.samplerVolumeFaderLSB</key>
                <description>Sampler Volume fader (LSB), Slider: SAMPLER VOLUME</description>
                <status>0xB6</status>
                <midino>0x23</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.jogPlatterTick</key>
                <description>Jog (no Vinyl Mode) Deck 3, left JOGDIAL (Deck 3 active)</description>
                <status>0xB2</status>
                <midino>0x23</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.jogPlatterTick</key>
                <description>Jog (no Vinyl Mode) Deck 4, right JOGDIAL (Deck 4 active)</description>
                <status>0xB3</status>
                <midino>0x23</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.jogPlatterTick</key>
                <description>Jog (no Vinyl Mode) Deck 1, left JOGDIAL (Deck 1 active)</description>
                <status>0xB0</status>
                <midino>0x23</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.jogPlatterTick</key>
                <description>Jog (no Vinyl Mode) Deck 2, right JOGDIAL (Deck 2 active)</description>
                <status>0xB1</status>
                <midino>0x23</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.filterLowKnobLSB</key>
                <description>Low level Deck 3 (LSB), Knob: LOW Deck 3</description>
                <status>0xB2</status>
                <midino>0x2F</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.filterLowKnobLSB</key>
                <description>Low level Deck 4 (LSB), Knob: LOW Deck 4</description>
                <status>0xB3</status>
                <midino>0x2F</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.filterLowKnobLSB</key>
                <description>Low level Deck 1 (LSB), Knob: LOW Deck 1</description>
                <status>0xB0</status>
                <midino>0x2F</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.filterLowKnobLSB</key>
                <description>Low level Deck 2 (LSB), Knob: LOW Deck 2</description>
                <status>0xB1</status>
                <midino>0x2F</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.loadButton</key>
                <description>Load selected Deck 2, Button: LOAD Deck 2</description>
                <status>0x96</status>
                <midino>0x47</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.filterMidKnobLSB</key>
                <description>Mid level Deck 3 (LSB), Knob: MID Deck 3</description>
                <status>0xB2</status>
                <midino>0x2B</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.filterMidKnobLSB</key>
                <description>Mid level Deck 4 (LSB), Knob: MID Deck 4</description>
                <status>0xB3</status>
                <midino>0x2B</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[EffectRack1_EffectUnit1]</group>
                <key>PioneerDDJSX3.effectUnit[1].enableButtons[1].input</key>
                <description>Enable (if effectFocusButton pressed: Focus) Effect 1 of Effect Unit 1, Button: FX1-1 ON</description>
                <status>0x94</status>
                <midino>0x47</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.filterMidKnobLSB</key>
                <description>Mid level Deck 1 (LSB), Knob: MID Deck 1</description>
                <status>0xB0</status>
                <midino>0x2B</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[EffectRack1_EffectUnit2]</group>
                <key>PioneerDDJSX3.effectUnit[2].enableButtons[1].input</key>
                <description>Enable (if effectFocusButton pressed: Focus) Effect 1 of Effect Unit 2, Button: FX2-1 ON</description>
                <status>0x95</status>
                <midino>0x47</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.filterMidKnobLSB</key>
                <description>Mid level Deck 2 (LSB), Knob: HI Deck 2</description>
                <status>0xB1</status>
                <midino>0x2B</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.playStutterButton</key>
                <description>Stutter Deck 3, Button: SHIFT &amp; left PLAY (Deck 3 active)</description>
                <status>0x92</status>
                <midino>0x47</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.playStutterButton</key>
                <description>Stutter Deck 4, Button: SHIFT &amp; right PLAY (Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x47</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.playStutterButton</key>
                <description>Stutter Deck 1, Button: SHIFT &amp; left PLAY (Deck 1 active)</description>
                <status>0x90</status>
                <midino>0x47</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.playStutterButton</key>
                <description>Stutter Deck 2, Button: SHIFT &amp; right PLAY (Deck 2 active)</description>
                <status>0x91</status>
                <midino>0x47</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.needleSearchTouch</key>
                <description>Jump to track position (Needle Search) Deck 3, Touch: left NEEDLE SEARCH (Deck 3 active)</description>
                <status>0x92</status>
                <midino>0x43</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.needleSearchTouch</key>
                <description>Jump to track position (Needle Search) Deck 4, Touch: right NEEDLE SEARCH (Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x43</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.needleSearchTouch</key>
                <description>Touch detection for Needle Search Deck 1, Touch: left NEEDLE SEARCH (Deck 1 active)</description>
                <status>0x90</status>
                <midino>0x43</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.needleSearchTouch</key>
                <description>Jump to track position (Needle Search) Deck 2, Touch: right NEEDLE SEARCH (Deck 2 active)</description>
                <status>0x91</status>
                <midino>0x43</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.shiftParameterRight</key>
                <description>Change Slicer domain (increment), Button: PARAMETER2 RIGHT (in SLICER-Mode, Deck 3 active)</description>
                <status>0x92</status>
                <midino>0x7B</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.shiftParameterRight</key>
                <description>Change Slicer domain (increment), Button: PARAMETER2 RIGHT (in SLICER-Mode, Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x7B</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.shiftParameterRight</key>
                <description>Change Slicer domain (increment), Button: PARAMETER2 RIGHT (in SLICER-Mode, Deck 1 active)</description>
                <status>0x90</status>
                <midino>0x7B</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.shiftParameterRight</key>
                <description>Change Slicer domain (increment), Button: PARAMETER2 RIGHT (in SLICER-Mode, Deck 2 active)</description>
                <status>0x91</status>
                <midino>0x7B</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[PreviewDeck1]</group>
                <key>PioneerDDJSX3.loadPrepareButton</key>
                <description>Preview of selected song, stop preview if no rotation between next press (Down: Load and start -- Up: Jump to position of User-Options), Button: LOAD PREPARE</description>
                <status>0x96</status>
                <midino>0x67</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.jogTouch</key>
                <description>Jog shift touch Deck 3, SHIFT left JOGDIAL (Deck 3 active)</description>
                <status>0x92</status>
                <midino>0x67</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.jogTouch</key>
                <description>Jog shift touch Deck 4, SHIFT right JOGDIAL (Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x67</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.jogTouch</key>
                <description>Jog shift touch Deck 1, SHIFT left JOGDIAL (Deck 1 active)</description>
                <status>0x90</status>
                <midino>0x67</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.jogTouch</key>
                <description>Jog shift touch Deck 2, SHIFT right JOGDIAL (Deck 2 active)</description>
                <status>0x91</status>
                <midino>0x67</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.toggleBeatloopMode</key>
                <description>Set PAD-Mode, Button: SHIFT ROLL LEFT (Deck 3 active)</description>
                <status>0x92</status>
                <midino>0x6B</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.toggleBeatloopMode</key>
                <description>Set PAD-Mode, Button: SHIFT ROLL RIGHT (Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x6B</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.toggleBeatloopMode</key>
                <description>Set PAD-Mode, Button: SHIFT ROLL LEFT (Deck 1 active)</description>
                <status>0x90</status>
                <midino>0x6B</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.toggleBeatloopMode</key>
                <description>Set PAD-Mode, Button: SHIFT ROLL RIGHT (Deck 2 active)</description>
                <status>0x91</status>
                <midino>0x6B</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.beatloopRollButtons</key>
                <description>Auto-Roll 1 Deck 4, Button: PAD5 (in ROLL-Mode, Deck 4 active)</description>
                <status>0x9A</status>
                <midino>0x14</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.beatloopRollButtons</key>
                <description>Auto-Roll 1 Deck 2, Button: PAD5 (in ROLL-Mode, Deck 2 active)</description>
                <status>0x98</status>
                <midino>0x14</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.beatloopRollButtons</key>
                <description>Auto-Roll 1 Deck 3, Button: PAD5 (in ROLL-Mode, Deck 3 active)</description>
                <status>0x99</status>
                <midino>0x14</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.beatloopRollButtons</key>
                <description>Auto-Roll Deck 1, Button: PAD5 (in ROLL-Mode, Deck 1 active)</description>
                <status>0x97</status>
                <midino>0x14</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.beatloopRollButtons</key>
                <description>Auto-Roll 1/16 Deck 4, Button: PAD1 (in ROLL-Mode, Deck 4 active)</description>
                <status>0x9A</status>
                <midino>0x10</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.autoLoopButton</key>
                <description>Set and enable/exit beatloop with length of beatloop_size Deck 3, Button: left AUTOLOOP (Deck 3 active)</description>
                <status>0x92</status>
                <midino>0x14</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.autoLoopButton</key>
                <description>Set and enable/exit beatloop with length of beatloop_size Deck 4, Button: right AUTOLOOP (Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x14</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.beatloopRollButtons</key>
                <description>Auto-Roll 1/16 Deck 2, Button: PAD1 (in ROLL-Mode, Deck 2 active)</description>
                <status>0x98</status>
                <midino>0x10</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.autoLoopButton</key>
                <description>Set and enable/exit beatloop with length of beatloop_size Deck 1, Button: left AUTOLOOP (Deck 1 active)</description>
                <status>0x90</status>
                <midino>0x14</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.beatloopRollButtons</key>
                <description>Auto-Roll 1/16 Deck 3, Button: PAD1 (in ROLL-Mode, Deck 3 active)</description>
                <status>0x99</status>
                <midino>0x10</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.autoLoopButton</key>
                <description>Set and enable/exit beatloop with length of beatloop_size Deck 2, Button: right AUTOLOOP (Deck 2 active)</description>
                <status>0x91</status>
                <midino>0x14</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.beatloopRollButtons</key>
                <description>Auto-Roll Deck 1, Button: PAD1 (in ROLL-Mode, Deck 1 active)</description>
                <status>0x97</status>
                <midino>0x10</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.loopInButton</key>
                <description>Manual loop in Deck 3, Button: LOOP IN (Deck 3 active)</description>
                <status>0x92</status>
                <midino>0x10</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.loopInButton</key>
                <description>Manual loop in Deck 4, Button: LOOP IN (Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x10</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.loopInButton</key>
                <description>Manual loop in Deck 1, Button: LOOP IN (Deck 1 active)</description>
                <status>0x90</status>
                <midino>0x10</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.loopInButton</key>
                <description>Manual loop in Deck 2, Button: LOOP IN (Deck 2 active)</description>
                <status>0x91</status>
                <midino>0x10</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.tempoResetButton</key>
                <description>Tempo(Rate) Reset Deck 3, Button: longpress left KEYLOCK (Deck 3 active)</description>
                <status>0x92</status>
                <midino>0x1C</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.tempoResetButton</key>
                <description>Tempo(Rate) Reset Deck 4, Button: longpress right KEYLOCK (Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x1C</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.tempoResetButton</key>
                <description>Tempo(Rate) Reset Deck 1, Button: longpress left KEYLOCK (Deck 1 active)</description>
                <status>0x90</status>
                <midino>0x1C</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.tempoResetButton</key>
                <description>Tempo(Rate) Reset Deck 2, Button: longpress right KEYLOCK (Deck 2 active)</description>
                <status>0x91</status>
                <midino>0x1C</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.crossfaderAssignRight</key>
                <description>Assigns Deck 3 to Crossfader, Switch right: CROSSFADER ASSIGN Deck 3</description>
                <status>0x92</status>
                <midino>0x18</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.crossfaderAssignRight</key>
                <description>Assigns Deck 4 to Crossfader, Switch right: CROSSFADER ASSIGN Deck 4</description>
                <status>0x93</status>
                <midino>0x18</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.crossfaderAssignRight</key>
                <description>Assigns Deck 1 to Crossfader, Switch right: CROSSFADER ASSIGN Deck 1</description>
                <status>0x90</status>
                <midino>0x18</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.crossfaderAssignRight</key>
                <description>Assigns Deck 2 to Crossfader, Switch right: CROSSFADER ASSIGN Deck 2</description>
                <status>0x91</status>
                <midino>0x18</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[EffectRack1_EffectUnit1]</group>
                <key>PioneerDDJSX3.effectUnit[1].knobs[2].inputMSB</key>
                <description>FX1 Effect 2 Select (MSB), Knob: SHIFT + FX1-2</description>
                <status>0xB4</status>
                <midino>0x14</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[EffectRack1_EffectUnit2]</group>
                <key>PioneerDDJSX3.effectUnit[2].knobs[2].inputMSB</key>
                <description>FX2 Effect 2 Select (MSB), Knob: SHIFT + FX2-2</description>
                <status>0xB5</status>
                <midino>0x14</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[EffectRack1_EffectUnit1]</group>
                <key>PioneerDDJSX3.effectUnit[1].dryWetKnob.input</key>
                <description>Super1 Parameter of Effect Unit 1, Knob: SHIFT &amp; FX1 BEATS</description>
                <status>0xB4</status>
                <midino>0x10</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[EffectRack1_EffectUnit2]</group>
                <key>PioneerDDJSX3.effectUnit[2].dryWetKnob.input</key>
                <description>Super1 Parameter of Effect Unit 2, Knob: SHIFT &amp; FX2 BEATS</description>
                <status>0xB5</status>
                <midino>0x10</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.cueButton</key>
                <description>Cue Deck 3, Button: left CUE (Deck 3 active)</description>
                <status>0x92</status>
                <midino>0x0C</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.cueButton</key>
                <description>Cue Deck 4, Button: right CUE (Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x0C</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.cueButton</key>
                <description>Cue Deck 1, Button: left CUE (Deck 1 active)</description>
                <status>0x90</status>
                <midino>0x0C</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.cueButton</key>
                <description>Cue Deck 2, Button: right CUE (Deck 2 active)</description>
                <status>0x91</status>
                <midino>0x0C</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.samplerButtons</key>
                <description>Sampler 5 play, Button: PAD5 (in SAMPLER-Mode, Deck 4 active)</description>
                <status>0x9A</status>
                <midino>0x34</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.filterKnobMSB</key>
                <description>Filter Deck 2 (MSB), Knob: FILTER Deck 2</description>
                <status>0xB6</status>
                <midino>0x18</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.samplerButtons</key>
                <description>Sampler 5 play, Button: PAD5 (in SAMPLER-Mode, Deck 2 active)</description>
                <status>0x98</status>
                <midino>0x34</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.samplerButtons</key>
                <description>Sampler 5 play, Button: PAD5 (in SAMPLER-Mode, Deck 3 active)</description>
                <status>0x99</status>
                <midino>0x34</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.samplerButtons</key>
                <description>Sampler 5 play, Button: PAD5 (in SAMPLER-Mode, Deck 1 active)</description>
                <status>0x97</status>
                <midino>0x34</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.samplerButtons</key>
                <description>Sampler 1 play, Button: PAD1 (in SAMPLER-Mode, Deck 4 active)</description>
                <status>0x9A</status>
                <midino>0x30</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.samplerButtons</key>
                <description>Sampler 1 play, Button: PAD1 (in SAMPLER-Mode, Deck 2 active)</description>
                <status>0x98</status>
                <midino>0x30</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[EffectRack1_EffectUnit1]</group>
                <key>PioneerDDJSX3.effectUnit[1].knobs[2].inputMSB</key>
                <description>FX1 Effect 2 Meta (MSB), Knob: FX1-2</description>
                <status>0xB4</status>
                <midino>0x04</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.samplerButtons</key>
                <description>Sampler 1 play, Button: PAD1 (in SAMPLER-Mode, Deck 3 active)</description>
                <status>0x99</status>
                <midino>0x30</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[EffectRack1_EffectUnit2]</group>
                <key>PioneerDDJSX3.effectUnit[2].knobs[2].inputMSB</key>
                <description>FX2 Effect 2 Meta (MSB), Knob: FX2-2</description>
                <status>0xB5</status>
                <midino>0x04</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.gainKnobMSB</key>
                <description>Gain Deck 3 (MSB), Knob: TRIM Deck 3</description>
                <status>0xB2</status>
                <midino>0x04</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.samplerButtons</key>
                <description>Sampler 1 play, Button: PAD1 (in SAMPLER-Mode, Deck 1 active)</description>
                <status>0x97</status>
                <midino>0x30</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.gainKnobMSB</key>
                <description>Gain Deck 4 (MSB), Knob: TRIM Deck 4</description>
                <status>0xB3</status>
                <midino>0x04</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.gainKnobMSB</key>
                <description>Gain Deck 1 (MSB), Knob: TRIM Deck 1</description>
                <status>0xB0</status>
                <midino>0x04</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.stopSamplerButtons</key>
                <description>Sampler 5 stop, Button: SHIFT &amp; PAD5 (in SAMPLER-Mode, Deck 4 active)</description>
                <status>0x9A</status>
                <midino>0x3C</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.gainKnobMSB</key>
                <description>Gain Deck 2 (MSB), Knob: TRIM Deck 2</description>
                <status>0xB1</status>
                <midino>0x04</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.stopSamplerButtons</key>
                <description>Sampler 5 stop, Button: SHIFT &amp; PAD5 (in SAMPLER-Mode, Deck 2 active)</description>
                <status>0x98</status>
                <midino>0x3C</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[EffectRack1_EffectUnit1]</group>
                <key>PioneerDDJSX3.effectUnit[1].dryWetKnob.input</key>
                <description>Dry/Wet Mixing Ratio of Effect Unit 1, Knob: FX1 BEATS</description>
                <status>0xB4</status>
                <midino>0x00</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.stopSamplerButtons</key>
                <description>Sampler 5 stop, Button: SHIFT &amp; PAD5 (in SAMPLER-Mode, Deck 3 active)</description>
                <status>0x99</status>
                <midino>0x3C</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[EffectRack1_EffectUnit2]</group>
                <key>PioneerDDJSX3.effectUnit[2].dryWetKnob.input</key>
                <description>Dry/Wet Mixing Ratio of Effect Unit 2, Knob: FX2 BEATS</description>
                <status>0xB5</status>
                <midino>0x00</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.tempoSliderMSB</key>
                <description>Tempo slider Deck 3 (MSB), Slider: left TEMPO (Deck 3 active)</description>
                <status>0xB2</status>
                <midino>0x00</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.stopSamplerButtons</key>
                <description>Sampler 5 stop, Button: SHIFT &amp; PAD5 (in SAMPLER-Mode, Deck 1 active)</description>
                <status>0x97</status>
                <midino>0x3C</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.tempoSliderMSB</key>
                <description>Tempo slider Deck 4 (MSB), Slider: right TEMPO (Deck 4 active)</description>
                <status>0xB3</status>
                <midino>0x00</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.tempoSliderMSB</key>
                <description>Tempo slider Deck 1 (MSB), Slider: left TEMPO (Deck 1 active)</description>
                <status>0xB0</status>
                <midino>0x00</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.stopSamplerButtons</key>
                <description>Sampler 1 stop, Button: SHIFT &amp; PAD1 (in SAMPLER-Mode, Deck 4 active)</description>
                <status>0x9A</status>
                <midino>0x38</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.tempoSliderMSB</key>
                <description>Tempo slider Deck 2 (MSB), Slider: right TEMPO (Deck 2 active)</description>
                <status>0xB1</status>
                <midino>0x00</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.stopSamplerButtons</key>
                <description>Sampler 1 stop, Button: SHIFT &amp; PAD1 (in SAMPLER-Mode, Deck 2 active)</description>
                <status>0x98</status>
                <midino>0x38</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.stopSamplerButtons</key>
                <description>Sampler 1 stop, Button: SHIFT &amp; PAD1 (in SAMPLER-Mode, Deck 3 active)</description>
                <status>0x99</status>
                <midino>0x38</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.stopSamplerButtons</key>
                <description>Sampler 1 stop, Button: SHIFT &amp; PAD1 (in SAMPLER-Mode, Deck 1 active)</description>
                <status>0x97</status>
                <midino>0x38</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.slicerButtons</key>
                <description>Slicer beatjump/loop Beat 5 Deck 4, Button: PAD5 (in SLICER-Mode, Deck 4 active)</description>
                <status>0x9A</status>
                <midino>0x24</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.reverseButton</key>
                <description>Play track backwards (reverse play) Deck 3, Button: SHIFT &amp; left CENSOR (Deck 3 active)</description>
                <status>0x92</status>
                <midino>0x38</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.reverseButton</key>
                <description>Play track backwards (reverse play) Deck 4, Button: SHIFT &amp; right CENSOR (Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x38</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.slicerButtons</key>
                <description>Slicer beatjump/loop Beat 5 Deck 2, Button: PAD5 (in SLICER-Mode, Deck 2 active)</description>
                <status>0x98</status>
                <midino>0x24</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.reverseButton</key>
                <description>Play track backwards (reverse play) Deck 1, Button: SHIFT &amp; left CENSOR (Deck 1 active)</description>
                <status>0x90</status>
                <midino>0x38</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.slicerButtons</key>
                <description>Slicer beatjump/loop Beat 5 Deck 3, Button: PAD5 (in SLICER-Mode, Deck 3 active)</description>
                <status>0x99</status>
                <midino>0x24</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.samplerVelocityVolume</key>
                <description>Sampler 5 play with velocity volume, Button: PAD5 (in SAMPLER-Mode, VELOCITY active, Deck 4 active)</description>
                <status>0xBA</status>
                <midino>0x34</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.reverseButton</key>
                <description>Play track backwards (reverse play) Deck 2, Button: SHIFT &amp; right CENSOR (Deck 2 active)</description>
                <status>0x91</status>
                <midino>0x38</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.slicerButtons</key>
                <description>Slicer beatjump/loop Beat 5 Deck 1, Button: PAD5 (in SLICER-Mode, Deck 1 active)</description>
                <status>0x97</status>
                <midino>0x24</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.samplerVelocityVolume</key>
                <description>Sampler 5 play with velocity volume, Button: PAD5 (in SAMPLER-Mode, VELOCITY active, Deck 2 active)</description>
                <status>0xB8</status>
                <midino>0x34</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.samplerVelocityVolume</key>
                <description>Sampler 5 play with velocity volume, Button: PAD5 (in SAMPLER-Mode, VELOCITY active, Deck 3 active)</description>
                <status>0xB9</status>
                <midino>0x34</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.slicerButtons</key>
                <description>Slicer beatjump/loop Beat 1 Deck 4, Button: PAD1 (in SLICER-Mode, Deck 4 active)</description>
                <status>0x9A</status>
                <midino>0x20</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.parameterLeft</key>
                <description>Beatjump amount of beatjump_size backwards, Button: PARAMETER1 LEFT (in HOTCUE-Mode, Deck 3 active)</description>
                <status>0x92</status>
                <midino>0x24</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.samplerVelocityVolume</key>
                <description>Sampler 5 play with velocity volume, Button: PAD5 (in SAMPLER-Mode, VELOCITY active, Deck 1 active)</description>
                <status>0xB7</status>
                <midino>0x34</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.parameterLeft</key>
                <description>Beatjump amount of beatjump_size backwards, Button: PARAMETER1 LEFT (in HOTCUE-Mode, Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x24</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.slicerButtons</key>
                <description>Slicer beatjump/loop Beat 1 Deck 2, Button: PAD1 (in SLICER-Mode, Deck 2 active)</description>
                <status>0x98</status>
                <midino>0x20</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[EffectRack1_EffectUnit1]</group>
                <key>PioneerDDJSX3.effectUnit[1].knobs[2].inputLSB</key>
                <description>FX1 Effect 2 Select (LSB), Knob: SHIFT + FX1-2</description>
                <status>0xB4</status>
                <midino>0x34</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.parameterLeft</key>
                <description>Beatjump amount of beatjump_size backwards, Button: PARAMETER1 LEFT (in HOTCUE-Mode, Deck 1 active)</description>
                <status>0x90</status>
                <midino>0x24</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.slicerButtons</key>
                <description>Slicer beatjump/loop Beat 1 Deck 3, Button: PAD1 (in SLICER-Mode, Deck 3 active)</description>
                <status>0x99</status>
                <midino>0x20</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[EffectRack1_EffectUnit2]</group>
                <key>PioneerDDJSX3.effectUnit[2].knobs[2].inputLSB</key>
                <description>FX2 Effect 2 Select (LSB), Knob: SHIFT + FX2-2</description>
                <status>0xB5</status>
                <midino>0x34</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.samplerVelocityVolume</key>
                <description>Sampler 1 play with velocity volume, Button: PAD1 (in SAMPLER-Mode, VELOCITY active, Deck 4 active)</description>
                <status>0xBA</status>
                <midino>0x30</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.parameterLeft</key>
                <description>Beatjump amount of beatjump_size backwards, Button: PARAMETER1 LEFT (in HOTCUE-Mode, Deck 2 active)</description>
                <status>0x91</status>
                <midino>0x24</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.slicerButtons</key>
                <description>Slicer beatjump/loop Beat 1 Deck 1, Button: PAD1 (in SLICER-Mode, Deck 1 active)</description>
                <status>0x97</status>
                <midino>0x20</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.samplerVelocityVolume</key>
                <description>Sampler 1 play with velocity volume, Button: PAD1 (in SAMPLER-Mode, VELOCITY active, Deck 2 active)</description>
                <status>0xB8</status>
                <midino>0x30</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.samplerVelocityVolume</key>
                <description>Sampler 1 play with velocity volume, Button: PAD1 (in SAMPLER-Mode, VELOCITY active, Deck 3 active)</description>
                <status>0xB9</status>
                <midino>0x30</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.toggleSlicerMode</key>
                <description>Set PAD-Mode, Button: SLICER LEFT (Deck 3 active)</description>
                <status>0x92</status>
                <midino>0x20</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.toggleSlicerMode</key>
                <description>Set PAD-Mode, Button: SLICER RIGHT (Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x20</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.samplerVelocityVolume</key>
                <description>Sampler 1 play with velocity volume, Button: PAD1 (in SAMPLER-Mode, VELOCITY active, Deck 1 active)</description>
                <status>0xB7</status>
                <midino>0x30</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.toggleSlicerMode</key>
                <description>Set PAD-Mode, Button: SLICER LEFT (Deck 1 active)</description>
                <status>0x90</status>
                <midino>0x20</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.toggleSlicerMode</key>
                <description>Set PAD-Mode, Button: SLICER RIGHT (Deck 2 active)</description>
                <status>0x91</status>
                <midino>0x20</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.parameterRight</key>
                <description>Beatjump amount of beatjump_size forwards, Button: PARAMETER1 RIGHT (in HOTCUE-Mode, Deck 3 active)</description>
                <status>0x92</status>
                <midino>0x2C</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.parameterRight</key>
                <description>Beatjump amount of beatjump_size forwards, Button: PARAMETER1 RIGHT (in HOTCUE-Mode, Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x2C</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.parameterRight</key>
                <description>Beatjump amount of beatjump_size forwards, Button: PARAMETER1 RIGHT (in HOTCUE-Mode, Deck 1 active)</description>
                <status>0x90</status>
                <midino>0x2C</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.parameterRight</key>
                <description>Beatjump amount of beatjump_size forwards, Button: PARAMETER1 RIGHT (in HOTCUE-Mode, Deck 2 active)</description>
                <status>0x91</status>
                <midino>0x2C</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.beatloopButtons</key>
                <description>Beatloop Deck 4, Button: PAD5 (in GROUP2-Mode, Deck 4 active)</description>
                <status>0x9A</status>
                <midino>0x54</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.filterKnobLSB</key>
                <description>Filter Deck 2 (LSB), Knob: FILTER Deck 2</description>
                <status>0xB6</status>
                <midino>0x38</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.beatloopButtons</key>
                <description>Beatloop Deck 2, Button: PAD5 (in GROUP2-Mode, Deck 2 active)</description>
                <status>0x98</status>
                <midino>0x54</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.beatloopButtons</key>
                <description>Beatloop Deck 3, Button: PAD5 (in GROUP2-Mode, Deck 3 active)</description>
                <status>0x99</status>
                <midino>0x54</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.fxAssignButton</key>
                <description>Effect Unit 2 assignment Deck 1, Button: FX2 assign Deck 1</description>
                <status>0x96</status>
                <midino>0x54</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.beatloopButtons</key>
                <description>Beatloop Deck 1, Button: PAD5 (in GROUP2-Mode, Deck 1 active)</description>
                <status>0x97</status>
                <midino>0x54</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.beatloopButtons</key>
                <description>Beatloop Deck 4, Button: PAD1 (in GROUP2-Mode, Deck 4 active)</description>
                <status>0x9A</status>
                <midino>0x50</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.headphoneCueButton</key>
                <description>Toggles headphone cueing Deck 3, Button: CUE Deck 3</description>
                <status>0x92</status>
                <midino>0x54</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.headphoneCueButton</key>
                <description>Toggles headphone cueing Deck 4, Button: right CUE (Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x54</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.beatloopButtons</key>
                <description>Beatloop Deck 2, Button: PAD1 (in GROUP2-Mode, Deck 2 active)</description>
                <status>0x98</status>
                <midino>0x50</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.headphoneCueButton</key>
                <description>Toggles headphone cueing Deck 1, Button: CUE Deck 1</description>
                <status>0x90</status>
                <midino>0x54</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.beatloopButtons</key>
                <description>Beatloop Deck 3, Button: PAD1 (in GROUP2-Mode, Deck 3 active)</description>
                <status>0x99</status>
                <midino>0x50</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[EffectRack1_EffectUnit1]</group>
                <key>PioneerDDJSX3.effectUnit[1].knobs[2].inputLSB</key>
                <description>FX1 Effect 2 Meta (LSB), Knob: FX1-2</description>
                <status>0xB4</status>
                <midino>0x24</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.headphoneCueButton</key>
                <description>Toggles headphone cueing Deck 2, Button: CUE Deck 2</description>
                <status>0x91</status>
                <midino>0x54</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.fxAssignButton</key>
                <description>Effect Unit 1 assignment Deck 1, Button: FX1 assign Deck 1</description>
                <status>0x96</status>
                <midino>0x50</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[EffectRack1_EffectUnit2]</group>
                <key>PioneerDDJSX3.effectUnit[2].knobs[2].inputLSB</key>
                <description>FX2 Effect 2 Meta (LSB), Knob: FX2-2</description>
                <status>0xB5</status>
                <midino>0x24</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.beatloopButtons</key>
                <description>Beatloop Deck 1, Button: PAD1 (in GROUP2-Mode, Deck 1 active)</description>
                <status>0x97</status>
                <midino>0x50</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.gainKnobLSB</key>
                <description>Gain Deck 3 (LSB), Knob: TRIM Deck 3</description>
                <status>0xB2</status>
                <midino>0x24</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.gainKnobLSB</key>
                <description>Gain Deck 4 (LSB), Knob: TRIM Deck 4</description>
                <status>0xB3</status>
                <midino>0x24</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.gainKnobLSB</key>
                <description>Gain Deck 1 (LSB), Knob: TRIM Deck 1</description>
                <status>0xB0</status>
                <midino>0x24</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.loopActiveButton</key>
                <description>Activate/Deactivate conf. loop Deck 3, Button: left AUTOLOOP (Deck 3 active)</description>
                <status>0x92</status>
                <midino>0x50</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.gainKnobLSB</key>
                <description>Gain Deck 2 (LSB), Knob: TRIM Deck 2</description>
                <status>0xB1</status>
                <midino>0x24</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.loopActiveButton</key>
                <description>Activate/Deactivate conf. loop Deck 4, Button: right AUTOLOOP (Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x50</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.loopActiveButton</key>
                <description>Activate/Deactivate conf. loop Deck 1, Button: left AUTOLOOP (Deck 1 active)</description>
                <status>0x90</status>
                <midino>0x50</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.loopActiveButton</key>
                <description>Activate/Deactivate conf. loop Deck 2, Button: right AUTOLOOP (Deck 2 active)</description>
                <status>0x91</status>
                <midino>0x50</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.tempoSliderLSB</key>
                <description>Tempo slider Deck 3 (LSB), Slider: left TEMPO (Deck 3 active)</description>
                <status>0xB2</status>
                <midino>0x20</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.tempoSliderLSB</key>
                <description>Tempo slider Deck 4 (LSB), Slider: right TEMPO (Deck 4 active)</description>
                <status>0xB3</status>
                <midino>0x20</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.tempoSliderLSB</key>
                <description>Tempo slider Deck 1 (LSB), Slider: left TEMPO (Deck 1 active)</description>
                <status>0xB0</status>
                <midino>0x20</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.quantizeButton</key>
                <description>Quantize Deck 3, Button: left SHIFT SYNC (Deck 3 active)</description>
                <status>0x92</status>
                <midino>0x5C</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.tempoSliderLSB</key>
                <description>Tempo slider Deck 2 (LSB), Slider: right TEMPO (Deck 2 active)</description>
                <status>0xB1</status>
                <midino>0x20</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.quantizeButton</key>
                <description>Quantize Deck 4, Button: right SHIFT SYNC (Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x5C</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.quantizeButton</key>
                <description>Quantize Deck 1, Button: left SHIFT SYNC (Deck 1 active)</description>
                <status>0x90</status>
                <midino>0x5C</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[AutoDJ]</group>
                <key>PioneerDDJSX3.autoDJToggleSyncBPM</key>
                <description>Auto DJ Sync BPM, Button: SHIFT &amp; LOAD1</description>
                <status>0x96</status>
                <midino>0x58</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.quantizeButton</key>
                <description>Quantize Deck 2, Button: right SHIFT SYNC (Deck 2 active)</description>
                <status>0x91</status>
                <midino>0x5C</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.syncButton</key>
                <description>Sync Deck 3, Button: left SYNC (Deck 3 active)</description>
                <status>0x92</status>
                <midino>0x5D</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.syncButton</key>
                <description>Sync Deck 4, Button: right SYNC (Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x5D</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.syncButton</key>
                <description>Sync Deck 1, Button: left SYNC (Deck 1 active)</description>
                <status>0x90</status>
                <midino>0x5D</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.syncButton</key>
                <description>Sync Deck 2, Button: right SYNC (Deck 2 active)</description>
                <status>0x91</status>
                <midino>0x5D</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.needleSearchStripPosition</key>
                <description>Jump to track position (Needle Search) Deck 3, Touch: left SHIFT NEEDLE SEARCH (Deck 3 active)</description>
                <status>0xB2</status>
                <midino>0x28</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.needleSearchStripPosition</key>
                <description>Jump to track position (Needle Search) Deck 4, Touch: right SHIFT NEEDLE SEARCH (Deck 4 active)</description>
                <status>0xB3</status>
                <midino>0x28</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.needleSearchStripPosition</key>
                <description>Jump to track position (Needle Search) Deck 1, Touch: left SHIFT NEEDLE SEARCH (Deck 1 active)</description>
                <status>0xB0</status>
                <midino>0x28</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.needleSearchTouch</key>
                <description>Touch detection for Needle Search Deck 3, Touch: left SHIFT NEEDLE SEARCH (Deck 3 active)</description>
                <status>0x92</status>
                <midino>0x44</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.needleSearchStripPosition</key>
                <description>Jump to track position (Needle Search) Deck 2, Touch: right SHIFT NEEDLE SEARCH (Deck 2 active)</description>
                <status>0xB1</status>
                <midino>0x28</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.needleSearchTouch</key>
                <description>Touch detection for Needle Search Deck 4, Touch: right SHIFT NEEDLE SEARCH (Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x44</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.needleSearchTouch</key>
                <description>Touch detection for Needle Search Deck 1, Touch: left SHIFT NEEDLE SEARCH (Deck 1 active)</description>
                <status>0x90</status>
                <midino>0x44</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.needleSearchTouch</key>
                <description>Touch detection for Needle Search Deck 2, Touch: right SHIFT NEEDLE SEARCH (Deck 2 active)</description>
                <status>0x91</status>
                <midino>0x44</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.slipButton</key>
                <description>Slip Deck 3, Button: left SLIP (Deck 3 active)</description>
                <status>0x92</status>
                <midino>0x40</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.slipButton</key>
                <description>Slip Deck 4, Button: right SLIP (Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x40</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.slipButton</key>
                <description>Slip Deck 1, Button: left SLIP (Deck 1 active)</description>
                <status>0x90</status>
                <midino>0x40</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.slipButton</key>
                <description>Slip Deck 2, Button: right SLIP (Deck 2 active)</description>
                <status>0x91</status>
                <midino>0x40</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.shiftLoopInButton</key>
                <description>Jump to current loop in point and stop playback Deck 3, Button: SHIFT + LOOP IN (Deck 3 active)</description>
                <status>0x92</status>
                <midino>0x4C</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.shiftLoopInButton</key>
                <description>Jump to current loop in point and stop playback Deck 4, Button: SHIFT + LOOP IN (Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x4C</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.shiftLoopInButton</key>
                <description>Jump to current loop in point and stop playback Deck 1, Button: SHIFT + LOOP IN (Deck 1 active)</description>
                <status>0x90</status>
                <midino>0x4C</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.shiftLoopInButton</key>
                <description>Jump to current loop in point and stop playback Deck 2, Button: SHIFT + LOOP IN (Deck 2 active)</description>
                <status>0x91</status>
                <midino>0x4C</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.loadButton</key>
                <description>Load selected Deck 3, Button: LOAD Deck 3</description>
                <status>0x96</status>
                <midino>0x48</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[EffectRack1_EffectUnit1]</group>
                <key>PioneerDDJSX3.effectUnit[1].enableButtons[2].input</key>
                <description>Enable (if effectFocusButton pressed: Focus) Effect 2 of Effect Unit 1, Button: FX1-2 ON</description>
                <status>0x94</status>
                <midino>0x48</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[EffectRack1_EffectUnit2]</group>
                <key>PioneerDDJSX3.effectUnit[2].enableButtons[2].input</key>
                <description>Enable (if effectFocusButton pressed: Focus) Effect 2 of Effect Unit 2, Button: FX2-2 ON</description>
                <status>0x95</status>
                <midino>0x48</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.jumpToBeginningButton</key>
                <description>Jump to beginning of the track and stop Deck 3, Button: left SHIFT CUE (Deck 3 active)</description>
                <status>0x92</status>
                <midino>0x48</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.jumpToBeginningButton</key>
                <description>Jump to beginning of the track and stop Deck 4, Button: right SHIFT CUE (Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x48</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.jumpToBeginningButton</key>
                <description>Jump to beginning of the track and stop Deck 1, Button: left SHIFT CUE (Deck 1 active)</description>
                <status>0x90</status>
                <midino>0x48</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.jumpToBeginningButton</key>
                <description>Jump to beginning of the track and stop Deck 2, Button: right SHIFT CUE (Deck 2 active)</description>
                <status>0x91</status>
                <midino>0x48</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Library]</group>
                <key>PioneerDDJSX3.rotarySelector</key>
                <description>Move vertical in Library (old: Select track in Playlist), Knob: BROWSER</description>
                <status>0xB6</status>
                <midino>0x40</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Master]</group>
                <key>PioneerDDJSX3.panelSelectButton</key>
                <description>Show/hide EffectRack/Sampler, Button: left PANEL SELECT</description>
                <status>0x96</status>
                <midino>0x78</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.gridSetButton</key>
                <description>Set Beat-Grid to current track position Deck 3, Button: left SHIFT + GRID ADJUST (Deck 3 active)</description>
                <status>0x92</status>
                <midino>0x64</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.gridSetButton</key>
                <description>Set Beat-Grid to current track position Deck 4, Button: right SHIFT + GRID ADJUST (Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x64</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.gridSetButton</key>
                <description>Set Beat-Grid to current track position Deck 1, Button: left SHIFT + GRID ADJUST (Deck 1 active)</description>
                <status>0x90</status>
                <midino>0x64</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.gridSetButton</key>
                <description>Set Beat-Grid to current track position Deck 2, Button: right SHIFT + GRID ADJUST (Deck 2 active)</description>
                <status>0x91</status>
                <midino>0x64</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.shiftKeyLockButton</key>
                <description>Tempo Range Deck 3, Button: left SHIFT &amp; KEYLOCK (Deck 3 active)</description>
                <status>0x92</status>
                <midino>0x60</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.shiftKeyLockButton</key>
                <description>Tempo Range Deck 4, Button: right SHIFT &amp; KEYLOCK (Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x60</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.shiftKeyLockButton</key>
                <description>Tempo Range Deck 1, Button: left SHIFT &amp; KEYLOCK (Deck 1 active)</description>
                <status>0x90</status>
                <midino>0x60</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.shiftKeyLockButton</key>
                <description>Tempo Range Deck 2, Button: right SHIFT &amp; KEYLOCK (Deck 2 active)</description>
                <status>0x91</status>
                <midino>0x60</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[AutoDJ]</group>
                <key>PioneerDDJSX3.autodjToggle</key>
                <description>Toggle AutoDJ On/Off, Button: SHIFT &amp; LOAD</description>
                <status>0x96</status>
                <midino>0x68</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.headphoneShiftCueButton</key>
                <description>Toggles BPM Tap Deck 3, Button: SHIFT &amp; CUE Deck 3</description>
                <status>0x92</status>
                <midino>0x68</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.headphoneShiftCueButton</key>
                <description>Toggles BPM Tap Deck 4, Button: SHIFT &amp; CUE Deck 4</description>
                <status>0x93</status>
                <midino>0x68</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.headphoneShiftCueButton</key>
                <description>Toggles BPM Tap Deck 1, Button: SHIFT &amp; CUE Deck 1</description>
                <status>0x90</status>
                <midino>0x68</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.headphoneShiftCueButton</key>
                <description>Toggles BPM Tap Deck 2, Button: SHIFT &amp; CUE Deck 2</description>
                <status>0x91</status>
                <midino>0x68</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Library]</group>
                <key>PioneerDDJSX3.rotarySelectorShifted</key>
                <description>Move horizontal in Library (old: Select Playlist), Knob: SHIFT &amp; BROWSER</description>
                <status>0xB6</status>
                <midino>0x64</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.beatloopRollButtons</key>
                <description>Auto-Roll 2 Deck 4, Button: PAD6 (in ROLL-Mode, Deck 4 active)</description>
                <status>0x9A</status>
                <midino>0x15</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.beatloopRollButtons</key>
                <description>Auto-Roll 2 Deck 2, Button: PAD6 (in ROLL-Mode, Deck 2 active)</description>
                <status>0x98</status>
                <midino>0x15</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.beatloopRollButtons</key>
                <description>Auto-Roll 2 Deck 3, Button: PAD6 (in ROLL-Mode, Deck 3 active)</description>
                <status>0x99</status>
                <midino>0x15</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.beatloopRollButtons</key>
                <description>Auto-Roll Deck 1, Button: PAD6 (in ROLL-Mode, Deck 1 active)</description>
                <status>0x97</status>
                <midino>0x15</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.beatloopRollButtons</key>
                <description>Auto-Roll 1/8 Deck 4, Button: PAD2 (in ROLL-Mode, Deck 4 active)</description>
                <status>0x9A</status>
                <midino>0x11</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.reverseRollButton</key>
                <description>ReverseRoll Deck 3, Button: left CENSOR (Deck 3 active)</description>
                <status>0x92</status>
                <midino>0x15</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.reverseRollButton</key>
                <description>ReverseRoll Deck 4, Button: right CENSOR (Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x15</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.beatloopRollButtons</key>
                <description>Auto-Roll 1/8 Deck 2, Button: PAD2 (in ROLL-Mode, Deck 2 active)</description>
                <status>0x98</status>
                <midino>0x11</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.reverseRollButton</key>
                <description>ReverseRoll Deck 1, Button: left CENSOR (Deck 1 active)</description>
                <status>0x90</status>
                <midino>0x15</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.beatloopRollButtons</key>
                <description>Auto-Roll 1/8 Deck 3, Button: PAD2 (in ROLL-Mode, Deck 3 active)</description>
                <status>0x99</status>
                <midino>0x11</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.reverseRollButton</key>
                <description>ReverseRoll Deck 2, Button: right CENSOR (Deck 2 active)</description>
                <status>0x91</status>
                <midino>0x15</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.beatloopRollButtons</key>
                <description>Auto-Roll Deck 1, Button: PAD2 (in ROLL-Mode, Deck 1 active)</description>
                <status>0x97</status>
                <midino>0x11</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.loopOutButton</key>
                <description>Manual loop out Deck 3, Button: LOOP OUT (Deck 3 active)</description>
                <status>0x92</status>
                <midino>0x11</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.loopOutButton</key>
                <description>Manual loop out Deck 4, Button: LOOP OUT (Deck 4 active)</description>
                <status>0x93</status>
                <midino>0x11</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.loopOutButton</key>
                <description>Manual loop out Deck 1, Button: LOOP OUT (Deck 1 active)</description>
                <status>0x90</status>
                <midino>0x11</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.loopOutButton</key>
                <description>Manual loop out Deck 2, Button: LOOP OUT (Deck 2 active)</description>
                <status>0x91</status>
                <midino>0x11</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel3]</group>
                <key>PioneerDDJSX3.crossfaderAssignCenter</key>
                <description>Disconnects Deck 3 from Crossfader, Switch center: CROSSFADER ASSIGN Deck 3</description>
                <status>0x92</status>
                <midino>0x1D</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel4]</group>
                <key>PioneerDDJSX3.crossfaderAssignCenter</key>
                <description>Disconnects Deck 4 from Crossfader, Switch center: CROSSFADER ASSIGN Deck 4</description>
                <status>0x93</status>
                <midino>0x1D</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel1]</group>
                <key>PioneerDDJSX3.crossfaderAssignCenter</key>
                <description>Disconnects Deck 1 from Crossfader, Switch center: CROSSFADER ASSIGN Deck 1</description>
                <status>0x90</status>
                <midino>0x1D</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
            <control>
                <group>[Channel2]</group>
                <key>PioneerDDJSX3.crossfaderAssignCenter</key>
                <description>Disconnects Deck 2 from Crossfader, Switch center: CROSSFADER ASSIGN Deck 2</description>
                <status>0x91</status>
                <midino>0x1D</midino>
                <options>
                    <script-binding/>
                </options>
            </control>
        </controls>
        <outputs/>
    </controller>
</MixxxControllerPreset>
]=])

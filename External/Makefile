colouring_dir:=./Colouring

trick_dir:=$(colouring_dir)/Trick
trick_url:=http://mat.gsia.cmu.edu/COLOR/instances

trick_graphs:=\
    DSJC1000.1.col.b\
    DSJC1000.5.col.b\
    DSJC1000.9.col.b\
    DSJC125.1.col.b\
    DSJC125.5.col.b\
    DSJC125.9.col.b\
    DSJC250.1.col.b\
    DSJC250.5.col.b\
    DSJC250.9.col.b\
    DSJC500.1.col.b\
    DSJC500.5.col.b\
    DSJC500.9.col.b\
    DSJR500.1.col.b\
    DSJR500.1c.col.b\
    DSJR500.5.col.b\
    flat1000_50_0.col.b\
    flat1000_60_0.col.b\
    flat1000_76_0.col.b\
    flat300_20_0.col.b\
    flat300_26_0.col.b\
    flat300_28_0.col.b\
    fpsol2.i.1.col\
    fpsol2.i.2.col\
    fpsol2.i.3.col\
    inithx.i.1.col\
    inithx.i.2.col\
    inithx.i.3.col\
    latin_square_10.col\
    le450_15a.col\
    le450_15b.col\
    le450_15c.col\
    le450_15d.col\
    le450_25a.col\
    le450_25b.col\
    le450_25c.col\
    le450_25d.col\
    le450_5a.col\
    le450_5b.col\
    le450_5c.col\
    le450_5d.col\
    mulsol.i.1.col\
    mulsol.i.2.col\
    mulsol.i.3.col\
    mulsol.i.4.col\
    mulsol.i.5.col\
    school1.col\
    school1_nsh.col\
    zeroin.i.1.col\
    zeroin.i.2.col\
    zeroin.i.3.col\
    anna.col\
    david.col\
    homer.col\
    huck.col\
    jean.col\
    games120.col\
    miles1000.col\
    miles1500.col\
    miles250.col\
    miles500.col\
    miles750.col\
    queen10_10.col\
    queen11_11.col\
    queen12_12.col\
    queen13_13.col\
    queen14_14.col\
    queen15_15.col\
    queen16_16.col\
    queen5_5.col\
    queen6_6.col\
    queen7_7.col\
    queen8_12.col\
    queen8_8.col\
    queen9_9.col\
    myciel3.col\
    myciel4.col\
    myciel5.col\
    myciel6.col\
    myciel7.col\

trick_urls:=$(addprefix $(trick_url)/, $(trick_graphs))
trick_data:=$(addprefix $(trick_dir)/, $(trick_graphs))

.PHONY: all clean

all: trick

trick: $(trick_data)

$(trick_data):
	wget -nv -P$(trick_dir) $(trick_urls)

$(output_dir)/:
	mkdir -p $@

clean:
	rm -rf $(trick_dir)


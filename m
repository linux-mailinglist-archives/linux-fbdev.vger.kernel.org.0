Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E8852C3922
	for <lists+linux-fbdev@lfdr.de>; Wed, 25 Nov 2020 07:37:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbgKYGgz (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 25 Nov 2020 01:36:55 -0500
Received: from pegase1.c-s.fr ([93.17.236.30]:50942 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725562AbgKYGgz (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 25 Nov 2020 01:36:55 -0500
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 4CgrlQ4mv8z9v4Wm;
        Wed, 25 Nov 2020 07:36:50 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id 9WOu8jrGC870; Wed, 25 Nov 2020 07:36:50 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 4CgrlQ2P6pz9v1VN;
        Wed, 25 Nov 2020 07:36:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 0A3DF8B7C1;
        Wed, 25 Nov 2020 07:36:51 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id NyjcLbCJ2q3z; Wed, 25 Nov 2020 07:36:50 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 710BA8B7B7;
        Wed, 25 Nov 2020 07:36:48 +0100 (CET)
Subject: Re: [PATCH 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
From:   Christophe Leroy <christophe.leroy@csgroup.eu>
To:     Michael Ellerman <mpe@ellerman.id.au>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Kate Stewart <kstewart@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "Desnes A. Nunes do Rosario" <desnesn@linux.ibm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Richard Fontana <rfontana@redhat.com>,
        Paul Mackerras <paulus@samba.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Sasha Levin <sashal@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Takashi Iwai <tiwai@suse.com>,
        YueHaibing <yuehaibing@huawei.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Leonardo Bras <leonardo@linux.ibm.com>,
        DTML <devicetree@vger.kernel.org>,
        Andrew Donnellan <ajd@linux.ibm.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Alistair Popple <alistair@popple.id.au>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Mark Brown <broonie@kernel.org>, git@xilinx.com,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Allison Randal <allison@lohutok.net>,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        Michal Simek <monstr@monstr.eu>, Wei Hu <weh@microsoft.com>,
        Christian Lamparter <chunkeey@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Armijn Hemel <armijn@tjaldur.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Enrico Weigelt <info@metux.net>,
        "David S. Miller" <davem@davemloft.net>,
        Thiago Jung Bauermann <bauerman@linux.ibm.com>
References: <cover.1585311091.git.michal.simek@xilinx.com>
 <CAK8P3a2mKPRFbRE3MWScr9GSiL4cpLg0wqv1Q28XDCZVPWgHfg@mail.gmail.com>
 <20200327131026.GT1922688@smile.fi.intel.com>
 <20200327131531.GU1922688@smile.fi.intel.com>
 <CAK8P3a1Z+ZPTDzgAjdz0a7d85R62BhUqkdEWgrwXh-OnYe6rog@mail.gmail.com>
 <20200327141434.GA1922688@smile.fi.intel.com>
 <b5adcc7a-9d10-d75f-50e3-9c150a7b4989@c-s.fr>
 <87mu7xum41.fsf@mpe.ellerman.id.au>
 <bac9af641140cf6df04e3532589a11c2f3bccd2f.camel@kernel.crashing.org>
 <87pncprwp9.fsf@mpe.ellerman.id.au>
 <5782f9a42ad8acd8b234fa9c15a09db93552dc6b.camel@kernel.crashing.org>
 <871roykwu6.fsf@mpe.ellerman.id.au>
 <CAK8P3a1XmeeP7FKfNwXZO8cXyJ_U_Jr0kjOaGZ6F=7OcoZ+0nw@mail.gmail.com>
 <87zha17otl.fsf@mpe.ellerman.id.au>
 <33b873a8-ded2-4866-fb70-c336fb325923@csgroup.eu>
Message-ID: <02a27887-55ce-2101-efce-b1236e164f15@csgroup.eu>
Date:   Wed, 25 Nov 2020 07:36:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <33b873a8-ded2-4866-fb70-c336fb325923@csgroup.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org



Le 21/05/2020 à 12:38, Christophe Leroy a écrit :
> 
> 
> Le 21/05/2020 à 09:02, Michael Ellerman a écrit :
>> Arnd Bergmann <arnd@arndb.de> writes:
>>> +On Wed, Apr 8, 2020 at 2:04 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>>>> Benjamin Herrenschmidt <benh@kernel.crashing.org> writes:
>>>>> On Fri, 2020-04-03 at 15:59 +1100, Michael Ellerman wrote:
>>>>>> Benjamin Herrenschmidt <benh@kernel.crashing.org> writes:
>>>>> IBM still put 40x cores inside POWER chips no ?
>>>>
>>>> Oh yeah that's true. I guess most folks don't know that, or that they
>>>> run RHEL on them.
>>>
>>> Is there a reason for not having those dts files in mainline then?
>>> If nothing else, it would document what machines are still being
>>> used with future kernels.
>>
>> Sorry that part was a joke :D  Those chips don't run Linux.
>>
> 
> Nice to know :)
> 
> What's the plan then, do we still want to keep 40x in the kernel ?
> 
> If yes, is it ok to drop the oldies anyway as done in my series 
> https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=172630 ?
> 
> (Note that this series will conflict with my series on hugepages on 8xx due to the 
> PTE_ATOMIC_UPDATES stuff. I can rebase the 40x modernisation series on top of the 8xx hugepages 
> series if it is worth it)
> 

Do we still want to keep 40x in the kernel ? We don't even have a running 40x QEMU machine as far as 
I know.

I'm asking because I'd like to drop the non CONFIG_VMAP_STACK code to simplify and ease stuff (code 
that works with vmalloc'ed stacks also works with stacks in linear memory), but I can't do it 
because 40x doesn't have VMAP_STACK and should I implement it for 40x, I have to means to test it.

So it would ease things if we could drop 40x completely, unless someone there has a 40x platform to 
test stuff.

Thanks
Christophe

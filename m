Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D010414A362
	for <lists+linux-fbdev@lfdr.de>; Mon, 27 Jan 2020 12:59:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730231AbgA0L7G (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 27 Jan 2020 06:59:06 -0500
Received: from mga17.intel.com ([192.55.52.151]:39529 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728981AbgA0L7G (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 27 Jan 2020 06:59:06 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 27 Jan 2020 03:59:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,369,1574150400"; 
   d="scan'208";a="221711981"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
  by orsmga008.jf.intel.com with SMTP; 27 Jan 2020 03:59:02 -0800
Received: by stinkbox (sSMTP sendmail emulation); Mon, 27 Jan 2020 13:59:01 +0200
Date:   Mon, 27 Jan 2020 13:59:01 +0200
From:   Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Rich Felker <dalias@libc.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] matroxfb: add Matrox MGA-G200eW board support
Message-ID: <20200127115901.GC13686@intel.com>
References: <20200125195506.GA16638@brightrain.aerifal.cx>
 <20200126071724.GA3520745@kroah.com>
 <CAMuHMdU32gF89zz86WH3AqkoPK7hdSjWMexJ1aLU9woe0qF0YA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdU32gF89zz86WH3AqkoPK7hdSjWMexJ1aLU9woe0qF0YA@mail.gmail.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Mon, Jan 27, 2020 at 11:40:24AM +0100, Geert Uytterhoeven wrote:
> Hi Greg,
> 
> On Sun, Jan 26, 2020 at 8:44 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Sat, Jan 25, 2020 at 02:55:06PM -0500, Rich Felker wrote:
> > > Signed-off-by: Rich Felker <dalias@libc.org>
> > > --
> >
> > I know I don't accept patches without any changelog text, don't know
> > about other subsystem maintainers...
> 
> FTR, I do, iff the one-line summary says everything that needs to be said.
> 
> What's the point in writing a full paragraph like:
> 
>    Currently the foo driver does not support the bar device.
>    As users may want to use the bar device, it makes perfect sense
>    to add support for the bar device to the foo driver.
>    Hence add support for the bar device to the foo driver.
> 
> if this doesn't add any value on top of the one-line summary?

At least it allows one to reply to *something*. If there's just a
subject line you have zero quoted context for the reply apart from
the patch itself. So rather confusing if you want to comment on
the overall thing rather than on any specific changes in the diff.


The other bad commit message style I dislike is the:

"Subject: Do something...

 ...because whatever."

As if the subject was a part of the first sentence of the commit
message. Often makes replies even more confusing since now you
have just a part of the sentece quoted.

I do understand why new people make this mistake though; There
should probably be a more explicit indication that the first
line is the subject when editing the commit message.

-- 
Ville Syrjälä
Intel

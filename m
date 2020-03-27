Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFBAC19578F
	for <lists+linux-fbdev@lfdr.de>; Fri, 27 Mar 2020 13:56:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbgC0M4b (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 27 Mar 2020 08:56:31 -0400
Received: from mga02.intel.com ([134.134.136.20]:20546 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726165AbgC0M4a (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 27 Mar 2020 08:56:30 -0400
IronPort-SDR: I5TShDeditDT9dV4Y/TTHN3j4eH2XRJQPqUg2RseKMB1zR5TggL+fnVgqF/GVLlOBklvtU7lp0
 HWl+cQJmBjog==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2020 05:56:30 -0700
IronPort-SDR: BEDOBxgnuwSQ+2jyF85GS0iJbNM04Dm3iBl/wzRSmQ80le+ACLNJLxAOl/jYii/rnGFzIrd/KL
 3m4wyYWKkR5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,312,1580803200"; 
   d="scan'208";a="239095895"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
  by fmsmga007.fm.intel.com with SMTP; 27 Mar 2020 05:56:26 -0700
Received: by stinkbox (sSMTP sendmail emulation); Fri, 27 Mar 2020 14:56:26 +0200
Date:   Fri, 27 Mar 2020 14:56:26 +0200
From:   Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To:     "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
Cc:     "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
        "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
        "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
        "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "b.zolnierkie@samsung.com" <b.zolnierkie@samsung.com>
Subject: Re: [Intel-gfx] [PATCH v7 05/18] video/hdmi: Add Unpack only
 function for DRM infoframe
Message-ID: <20200327125626.GE13686@intel.com>
References: <20200211074657.231405-1-gwan-gyeong.mun@intel.com>
 <20200211074657.231405-6-gwan-gyeong.mun@intel.com>
 <87k13fcm8w.fsf@intel.com>
 <87h7yjcldq.fsf@intel.com>
 <20200320115737.GF5193@pendragon.ideasonboard.com>
 <2dd87897a2c1dea8d882141823ed1ca1206ec01c.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2dd87897a2c1dea8d882141823ed1ca1206ec01c.camel@intel.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Fri, Mar 27, 2020 at 07:27:56AM +0000, Mun, Gwan-gyeong wrote:
> On Fri, 2020-03-20 at 13:57 +0200, Laurent Pinchart wrote:
> > Hi Jani,
> > 
> > On Fri, Mar 20, 2020 at 01:32:17PM +0200, Jani Nikula wrote:
> > > On Fri, 20 Mar 2020, Jani Nikula <jani.nikula@linux.intel.com>
> > > wrote:
> > > > On Tue, 11 Feb 2020, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> > > > wrote:
> > > > > It adds an unpack only function for DRM infoframe for dynamic
> > > > > range and
> > > > > mastering infoframe readout.
> > > > > It unpacks the information data block contained in the binary
> > > > > buffer into
> > > > > a structured frame of the HDMI Dynamic Range and Mastering
> > > > > (DRM)
> > > > > information frame.
> > > > > 
> > > > > In contrast to hdmi_drm_infoframe_unpack() function, it does
> > > > > not verify
> > > > > a checksum.
> > > > > 
> > > > > It can be used for unpacking a DP HDR Metadata Infoframe SDP
> > > > > case.
> > > > > DP HDR Metadata Infoframe SDP uses the same Dynamic Range and
> > > > > Mastering
> > > > > (DRM) information (CTA-861-G spec.) such as HDMI DRM infoframe.
> > > > > But DP SDP header and payload structure are different from HDMI
> > > > > DRM
> > > > > Infoframe. Therefore unpacking DRM infoframe for DP requires
> > > > > skipping of
> > > > > a verifying checksum.
> > > > > 
> > > > > Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> > > > > Reviewed-by: Uma Shankar <uma.shankar@intel.com>
> > > > 
> > > > Bartlomiej, can I have your ack for merging this via drm-intel
> > > > along
> > > > with the rest of the series, please?
> > > 
> > > Or Hans or Laurent, from v4l/video point of view.
> > 
> > I'm no expert on InfoFrame, I'll only comment on the API below.
> > 
> > > > > ---
> > > > >  drivers/video/hdmi.c | 58 +++++++++++++++++++++++++++++++-----
> > > > > --------
> > > > >  include/linux/hdmi.h |  2 ++
> > > > >  2 files changed, 43 insertions(+), 17 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/video/hdmi.c b/drivers/video/hdmi.c
> > > > > index 9c82e2a0a411..9818836d82b7 100644
> > > > > --- a/drivers/video/hdmi.c
> > > > > +++ b/drivers/video/hdmi.c
> > > > > @@ -1775,20 +1775,18 @@ hdmi_vendor_any_infoframe_unpack(union
> > > > > hdmi_vendor_any_infoframe *frame,
> > > > >  }
> > > > >  
> > > > >  /**
> > > > > - * hdmi_drm_infoframe_unpack() - unpack binary buffer to a
> > > > > HDMI DRM infoframe
> > > > > + * hdmi_drm_infoframe_unpack_only() - unpack binary buffer to
> > > > > a HDMI DRM infoframe
> > > > >   * @frame: HDMI DRM infoframe
> > > > >   * @buffer: source buffer
> > > > >   * @size: size of buffer
> > > > >   *
> > > > > - * Unpacks the information contained in binary @buffer into a
> > > > > structured
> > > > > + * Unpacks the information data block contained in binary
> > > > > @buffer into a structured
> > 
> > Line wrap please.
> > 
> > This needs to be clarified to explain exactly what the buffer points
> > to.
> > 
> Okay I'll update clear comments next version.
> > Also, as this is applicable to DP too, shouldn't we drop the hdmi_
> > prefix ? Is there another prefix that could be used for functions
> > that
> > are application to infoframe handling shared by different display
> > interfaces ? A bit of refactoring would help making all this clear.
> > 
> Both DP and HDMI use CTA-861-G spec for DRM infoframe. I'll update
> prefix with cta_ instead of hdmi_.

Most of video/hdmi.c is from the CTA spec(s). The name is just a name.
Let's not start making it inconsistent just for this one case.

-- 
Ville Syrjälä
Intel

Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08CD11B9FF4
	for <lists+linux-fbdev@lfdr.de>; Mon, 27 Apr 2020 11:33:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726349AbgD0JdZ (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 27 Apr 2020 05:33:25 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:59990 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726243AbgD0JdZ (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 27 Apr 2020 05:33:25 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03R9XClf010733;
        Mon, 27 Apr 2020 09:33:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=11qvfcxGS4aOSNS8xBvKoNjWoqLgWCx7bu2daoW/Zo0=;
 b=BTWu60NluZc5UFN/cPDU36l7m8CIvTyu2Iol3/6dEEOmejoi9hnjXSrJUrM99fTUey/8
 YhA0W95PaYTkE11/V2mxEtin3Z2Qgvjwf/pglJ/B9QDdofWbPtCXvmtSLbraMDc5Si0f
 Ge0XpaLe1sc2oX6mT+g7GL12YQr97y9XH5Tce3Wqyp2mAgANF3J9MYZYUEjeu7Po+Xf6
 pZGVv9HqpuK6PJ0rjQS3ASC7lUYpr34Lh39hYNNOCpsluvufoW27t9A8zGM+qc57hQGB
 QNyjWXzARYxjV+u5BrVoeSaQFAV6P7ehgaFOTXxINf1tEExY9exznPbUkPaVPmc+PGav /w== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 30nucerhmv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 27 Apr 2020 09:33:15 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03R9WuP7054902;
        Mon, 27 Apr 2020 09:33:14 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3020.oracle.com with ESMTP id 30my08uuwg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 27 Apr 2020 09:33:14 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 03R9XDQD007531;
        Mon, 27 Apr 2020 09:33:13 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 27 Apr 2020 02:33:12 -0700
Date:   Mon, 27 Apr 2020 12:33:06 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Oliver Graute <oliver.graute@gmail.com>
Cc:     gregkh@linuxfoundation.org, devel@driverdev.osuosl.org,
        linux-fbdev@vger.kernel.org,
        Oliver Graute <oliver.graute@kococonnector.com>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1] staging: fbtft: fb_st7789v: Initialize the Display
Message-ID: <20200427093306.GU2682@kadam>
References: <1586424337-26602-1-git-send-email-oliver.graute@gmail.com>
 <20200409102013.GP2001@kadam>
 <20200427083642.GD18436@portage>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200427083642.GD18436@portage>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9603 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004270086
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9603 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 mlxlogscore=999 mlxscore=0 adultscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004270086
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Mon, Apr 27, 2020 at 10:36:42AM +0200, Oliver Graute wrote:
> On 09/04/20, Dan Carpenter wrote:
> > On Thu, Apr 09, 2020 at 11:25:32AM +0200, Oliver Graute wrote:
> > > From: Oliver Graute <oliver.graute@kococonnector.com>
> > > 
> > > Set Gamma Values and Register Values for the HSD20_IPS
> > > 
> > > Signed-off-by: Oliver Graute <oliver.graute@kococonnector.com>
> > > ---
> > >  drivers/staging/fbtft/fb_st7789v.c | 12 ++++++------
> > >  1 file changed, 6 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/staging/fbtft/fb_st7789v.c b/drivers/staging/fbtft/fb_st7789v.c
> > > index 84c5af2dc9a0..b0aa96b703a8 100644
> > > --- a/drivers/staging/fbtft/fb_st7789v.c
> > > +++ b/drivers/staging/fbtft/fb_st7789v.c
> > > @@ -17,8 +17,8 @@
> > >  #define DRVNAME "fb_st7789v"
> > >  
> > >  #define DEFAULT_GAMMA \
> > > -	"70 2C 2E 15 10 09 48 33 53 0B 19 18 20 25\n" \
> > > -	"70 2C 2E 15 10 09 48 33 53 0B 19 18 20 25"
> > > +	"D0 05 0A 09 08 05 2E 44 45 0F 17 16 2B 33\n" \
> > > +	"D0 05 0A 09 08 05 2E 43 45 0F 16 16 2B 33"
> > 
> > How do you know this won't break someone else's setup?
> 
> Should I declare an extra define for my values?
> 
> +#define HSD20_IPS_GAMMA \
> +	"D0 05 0A 09 08 05 2E 44 45 0F 17 16 2B 33\n" \
> +	"D0 05 0A 09 08 05 2E 43 45 0F 16 16 2B 33"
> 

That's fine, but it can't be a compile time thing.  Both types of
hardware have to be working/available at run time.

regards,
dan carpenter


